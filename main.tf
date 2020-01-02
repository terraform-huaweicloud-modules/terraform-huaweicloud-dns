terraform {
  required_version = ">= 0.12"
}

# Create DNS zone
resource "huaweicloud_dns_zone_v2" "this" {
  count       = var.zone_id=="" ? 1 : 0
  name        = var.zone_name
  zone_type   = var.zone_type
  email       = var.email
  description = var.description
  router {
    router_id     = var.router_id
    router_region = var.router_region
  }
}

# Create DNS recordset
resource "huaweicloud_dns_recordset_v2" "this" {
  count       = length(var.recordsets)
  zone_id     = var.zone_id=="" ? join("",huaweicloud_dns_zone_v2.this.*.id) : var.zone_id
  name        = var.recordsets[count.index]["name"]
  ttl         = var.recordsets[count.index]["ttl"]
  type        = var.recordsets[count.index]["type"]
  records     = var.recordsets[count.index]["records"]
  description = var.recordsets[count.index]["description"]
}
