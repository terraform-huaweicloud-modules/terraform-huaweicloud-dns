output "custom_line_id" {
  description = "The ID of the DNS custom line"

  value = try(huaweicloud_dns_custom_line.this[0].id, "")
}
