output "endpoint_id" {
  description = "The ID of the endpoint"

  value = module.dns_resolver.endpoint_id
}

output "endpoint_assignments" {
  description = "The list of IP addresses assigned to the endpoint"

  value = module.dns_resolver.endpoint_assignments
}

output "resolver_rules_configuration" {
  description = "The basic configuration list of the resolver rules"

  value = module.dns_resolver.resolver_rules_configuration
}

output "resolver_rules_associate_vpcs_configuration" {
  description = "The VPCs configuration for the resolver rules"

  value = module.dns_resolver.resolver_rules_associate_vpcs_configuration
}

