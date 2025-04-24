
resource "huaweicloud_dns_custom_line" "this" {
  count = var.is_custom_line_create ? 1 : 0

  name        = var.custom_line_name
  ip_segments = var.custom_line_ip_segments
  description = var.custom_line_description != "" ? var.custom_line_description : null

  lifecycle {
    precondition {
      condition     = var.custom_line_name != ""
      error_message = "The custom_line_name is required if the is_custom_line_create is true."
    }
    precondition {
      condition     = length(var.custom_line_ip_segments) != 0
      error_message = "The custom_line_name is required if the is_custom_line_create is true."
    }
  }
}
