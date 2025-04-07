output "endpoint_id" {
  description = "The ID of the endpoint"

  value = module.dns_resolver.endpoint_id
}

output "endpoint_assignments" {
  description = "The list of IP addresses assigned to the endpoint"

  value = module.dns_resolver.endpoint_assignments
}
