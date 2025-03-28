provider "huaweicloud" {
  region = var.region_name
}

data "huaweicloud_availability_zones" "this" {}

module "vpc_network" {
  source = "github.com/terraform-huaweicloud-modules/terraform-huaweicloud-vpc?ref=v1.2.0"

  enterprise_project_id = var.enterprise_project_id
  availability_zone     = try(data.huaweicloud_availability_zones.this.names[0], "")

  vpc_name              = var.vpc_name
  vpc_cidr              = var.vpc_cidr
  subnets_configuration = var.subnets_configuration

  is_security_group_create = false
}

module "dns_resolver" {
  source = "../../modules/dns-resolver"

  endpoint_name = var.endpoint_name
  endpoint_type = var.endpoint_type

  # Assign two IPs to a subnet.
  endpoint_assignments = try(module.vpc_network.subnet_ids[0], "") != "" ? [for v in var.endpoint_ip_addresses : {
    "subnet_id" : module.vpc_network.subnet_ids[0],
    "ip_address" : v
  }] : []
}
