provider "huaweicloud" {
  region = var.region_name
}

resource "random_password" "this" {
  length           = 16
  special          = true
  min_numeric      = 1
  min_special      = 1
  min_lower        = 1
  min_upper        = 1
  override_special = "!#"
}

data "huaweicloud_availability_zones" "this" {}

module "vpc_network" {
  source = "github.com/terraform-huaweicloud-modules/terraform-huaweicloud-vpc?ref=v1.2.0"

  enterprise_project_id = var.enterprise_project_id
  availability_zone     = try(data.huaweicloud_availability_zones.this.names[0], "")

  vpc_name              = var.vpc_name
  vpc_cidr              = var.vpc_cidr
  subnets_configuration = var.subnets_configuration

  security_group_name = var.security_group_name
}

module "ecs_instance" {
  source = "github.com/terraform-huaweicloud-modules/terraform-huaweicloud-ecs"

  enterprise_project_id = var.enterprise_project_id
  availability_zone     = try(data.huaweicloud_availability_zones.this.names[0], "")

  instance_flavor_cpu_core_count = var.instance_flavor_cpu_core_count
  instance_flavor_memory_size    = var.instance_flavor_memory_size
  instance_image_os_type         = var.instance_image_os_type
  instance_image_architecture    = var.instance_image_architecture
  instance_name                  = var.instance_name

  instance_admin_pass         = random_password.this.result
  instance_security_group_ids = [module.vpc_network.security_group_id]

  instance_networks_configuration = try(module.vpc_network.subnet_ids[0], "") != "" ? [
    {
      uuid = module.vpc_network.subnet_ids[0]
    }
  ] : []
}

module "eip_publicip" {
  source = "github.com/terraform-huaweicloud-modules/terraform-huaweicloud-eip/modules/eip-publicip"

  enterprise_project_id = var.enterprise_project_id

  eip_publicip_configuration  = var.eip_publicip_configuration
  eip_bandwidth_configuration = var.eip_bandwidth_configuration
  eip_name                    = var.eip_name

  eip_associates_configuration = [
    {
      associate_instance_type = "PORT"
      associate_instance_id   = try(module.ecs_instance.instance_networks[0].port, "")
    }
  ]
}

module "dns_ptrrecord" {
  source = "../../modules/dns-ptrrecord"

  enterprise_project_id = var.enterprise_project_id

  ptrrecord_name          = var.ptrrecord_name
  ptrrecord_floatingip_id = module.eip_publicip.eip_id
  ptrrecord_ttl           = var.ptrrecord_ttl
  ptrrecord_description   = var.ptrrecord_description
  ptrrecord_tags          = var.ptrrecord_tags
}
