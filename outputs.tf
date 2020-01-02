output "this_dns_zone_id" {
  description = "The ID of the DNS zone"
  value       = var.zone_id=="" ? huaweicloud_dns_zone_v2.this[0].id : var.zone_id
}

output "this_dns_recordset_ids" {
  description = "List of IDs of the DNS recordsets"
  value       = join(",", huaweicloud_dns_recordset_v2.this.*.id)
}

