resource "huaweicloud_dns_ptrrecord" "this" {
  count = var.is_ptrrecord_create ? 1 : 0

  enterprise_project_id = var.enterprise_project_id

  name          = var.ptrrecord_name
  floatingip_id = var.ptrrecord_floatingip_id
  ttl           = var.ptrrecord_ttl
  description   = var.ptrrecord_description != "" ? var.ptrrecord_description : null
  tags          = var.ptrrecord_tags

  lifecycle {
    precondition {
      condition     = var.ptrrecord_name != ""
      error_message = "The ptrrecord_name is required if the is_ptrrecord_create is true."
    }
    precondition {
      condition     = var.ptrrecord_floatingip_id != ""
      error_message = "The ptrrecord_floatingip_id is required if the is_ptrrecord_create is true."
    }
  }
}
