output "public_zone_id" {
  description = "The ID of the DNS public zone"

  value = module.dns_zone.zone_id
}

output "custom_line_id" {
  description = "The ID of the DNS custom line"

  value = module.dns_custom_line.custom_line_id
}

