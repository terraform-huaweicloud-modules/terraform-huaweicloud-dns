output "ptrrecord_id" {
  description = "The ID of the PTR record, the format is {region}:{floatingip_id}"

  value = try(huaweicloud_dns_ptrrecord.this[0].id, "")
}

output "ptrrecord_associated_address" {
  description = "The address of the GEIP/EIP associated with PTR record"

  value = try(huaweicloud_dns_ptrrecord.this[0].address, "")
}
