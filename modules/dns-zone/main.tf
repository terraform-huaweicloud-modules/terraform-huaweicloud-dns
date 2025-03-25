resource "huaweicloud_dns_zone" "this" {
  count = var.is_zone_create ? 1 : 0

  enterprise_project_id = var.enterprise_project_id != "" ? var.enterprise_project_id : null

  name          = var.zone_name
  email         = var.zone_email != "" ? var.zone_email : null
  description   = var.zone_description != "" ? var.zone_description : null
  ttl           = var.zone_ttl
  zone_type     = var.zone_type
  status        = var.zone_status != "" ? var.zone_status : null
  tags          = var.zone_tags
  proxy_pattern = var.zone_proxy_pattern != "" ? var.zone_proxy_pattern : null

  dynamic "router" {
    for_each = var.zone_routers

    content {
      router_id     = router.value["router_id"]
      router_region = router.value["router_region"]
    }
  }

  lifecycle {
    precondition {
      condition     = var.zone_name != ""
      error_message = "The zone_name is required if the is_zone_create is true."
    }
  }
}

resource "huaweicloud_dns_recordset" "this" {
  count = length(var.record_sets_configuration)

  zone_id = lookup(element(var.record_sets_configuration, count.index), "zone_id", "") != "" ? lookup(element(var.record_sets_configuration,
  count.index), "zone_id") : var.is_zone_create ? huaweicloud_dns_zone.this[0].id : ""

  name        = lookup(element(var.record_sets_configuration, count.index), "name", "")
  type        = lookup(element(var.record_sets_configuration, count.index), "type", "")
  records     = lookup(element(var.record_sets_configuration, count.index), "records", [])
  ttl         = lookup(element(var.record_sets_configuration, count.index), "ttl", null)
  line_id     = lookup(element(var.record_sets_configuration, count.index), "line_id", "") != "" ? lookup(element(var.record_sets_configuration, count.index), "line_id") : null
  status      = lookup(element(var.record_sets_configuration, count.index), "status", "") != "" ? lookup(element(var.record_sets_configuration, count.index), "status") : null
  tags        = lookup(element(var.record_sets_configuration, count.index), "tags", {})
  description = lookup(element(var.record_sets_configuration, count.index), "description", "") != "" ? lookup(element(var.record_sets_configuration, count.index), "description") : null
  weight      = lookup(element(var.record_sets_configuration, count.index), "weight", null)
}
