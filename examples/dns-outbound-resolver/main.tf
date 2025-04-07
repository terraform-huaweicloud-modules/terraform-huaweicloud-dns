provider "huaweicloud" {
  region = var.region_name
}

data "huaweicloud_availability_zones" "this" {}

# Create three VPCs, and the first one is used for zone.
module "vpc_network" {
  for_each = { for index, config in var.vpc_network_configurations : index => config }

  source = "github.com/terraform-huaweicloud-modules/terraform-huaweicloud-vpc?ref=v1.2.0"

  enterprise_project_id = var.enterprise_project_id
  availability_zone     = try(data.huaweicloud_availability_zones.this.names[0], "")

  vpc_name              = each.value.vpc_name
  vpc_cidr              = each.value.vpc_cidr
  subnets_configuration = each.value.subnets_configuration

  is_security_group_create = false
}

module "dns_zone" {
  source = "../../modules/dns-zone"

  enterprise_project_id = var.enterprise_project_id

  # Inbound endpoint don't need to create zone.
  is_zone_create = var.zone_name != ""
  zone_name      = var.zone_name
  zone_type      = var.zone_type

  zone_routers = try(module.vpc_network[0].vpc_id, "") != "" ? [
    {
      router_id = module.vpc_network[0].vpc_id
    }
  ] : []
}

module "dns_resolver" {
  source = "../../modules/dns-resolver"

  endpoint_name = var.endpoint_name
  endpoint_type = var.endpoint_type

  # Assign two IPs to a subnet.
  endpoint_assignments = try(module.vpc_network[0].subnet_ids[0], "") != "" ? [for v in var.endpoint_ip_addresses : {
    "subnet_id" : module.vpc_network[0].subnet_ids[0],
    "ip_address" : v
  }] : []

  resolver_rules_configuration = [for v in var.resolver_rules_configuration : {
    "name"        = v.name,
    "domain_name" = module.dns_zone.zone_name
    ip_addresses  = v.ip_addresses,
    # The zone name and resolver rule cannot use the same VPC ID.
    vpc_ids = [for i, v in module.vpc_network : v.vpc_id if i > 0]
  }]
}
