output "zone_id" {
  description = "The ID of the zone"

  value = try(huaweicloud_dns_zone.this[0].id, "")
}

output "zone_name" {
  description = "The name of the zone"

  value = try(huaweicloud_dns_zone.this[0].name, "")
}

output "record_sets_configuration" {
  description = "The basic configuration list of the record sets"

  value = [for o in huaweicloud_dns_recordset.this : {
    "id" : o.id,
    "zone_id" : o.zone_id,
    "name" : o.name,
    "type" : o.type,
    "status" : o.status,
  }]
}
