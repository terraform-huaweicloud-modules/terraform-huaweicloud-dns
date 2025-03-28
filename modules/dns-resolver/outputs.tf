output "endpoint_id" {
  description = "The ID of the endpoint"

  value = try(huaweicloud_dns_endpoint_assignment.this[0].id, "")
}

output "endpoint_assignments" {
  description = "The list of assigned IP addresses under specified endpoint"

  value = try(huaweicloud_dns_endpoint_assignment.this[0].assignments, "")
}

output "resolver_rules_configuration" {
  description = "The basic configuration list of the resolver rules"

  value = [for o in huaweicloud_dns_resolver_rule.this : {
    "id" : o.id,
    "domain_name" : o.domain_name,
    "ip_addresses" : o.ip_addresses,
  }]
}

output "resolver_rules_associate_vpcs_configuration" {
  description = "The VPCs associated with resolver rules"

  value = [for o in huaweicloud_dns_resolver_rule_associate.this : {
    "id" : o.id,
    "resolver_rule_id" : o.resolver_rule_id,
    "vpc_id" : o.vpc_id,
  }]
}
