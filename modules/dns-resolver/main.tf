resource "huaweicloud_dns_endpoint_assignment" "this" {
  count = var.is_endpoint_create ? 1 : 0

  name      = var.endpoint_name
  direction = var.endpoint_type

  dynamic "assignments" {
    for_each = var.endpoint_assignments
    content {
      subnet_id  = assignments.value.subnet_id
      ip_address = assignments.value.ip_address
    }
  }

  lifecycle {
    precondition {
      condition     = var.endpoint_name != ""
      error_message = "The endpoint_name is required if the is_endpoint_create is true."
    }
    precondition {
      condition     = var.endpoint_type != ""
      error_message = "The endpoint_name is required if the is_endpoint_create is true."
    }
  }
}

resource "huaweicloud_dns_resolver_rule" "this" {
  count = length(var.resolver_rules_configuration)

  endpoint_id = lookup(element(var.resolver_rules_configuration, count.index), "endpoint_id", "") != "" ? lookup(element(var.resolver_rules_configuration, count.index), "endpoint_id") : var.is_endpoint_create ? huaweicloud_dns_endpoint_assignment.this[0].id : ""
  name        = lookup(element(var.resolver_rules_configuration, count.index), "name", "")
  domain_name = lookup(element(var.resolver_rules_configuration, count.index), "domain_name", "")

  # The IP addressess of the DNS in the on-premises data center.
  dynamic "ip_addresses" {
    for_each = lookup(element(var.resolver_rules_configuration, count.index), "ip_addresses", [])
    content {
      ip = ip_addresses.value
    }
  }
}

locals {
  associate_vpcs_configuration = flatten([for i, o in var.resolver_rules_configuration :
  [for v in o["vpc_ids"] : { resolver_rule_id = huaweicloud_dns_resolver_rule.this[i].id, vpc_id = v }]])
  associates_configuration = concat(local.associate_vpcs_configuration, var.resolver_rule_associates_configuration)
}

resource "huaweicloud_dns_resolver_rule_associate" "this" {
  count            = length(local.associates_configuration)
  resolver_rule_id = lookup(element(local.associates_configuration, count.index), "resolver_rule_id", "")
  # The zone name and resolver rule cannot use the same VPC ID.
  vpc_id = lookup(element(local.associates_configuration, count.index), "vpc_id", "")
}
