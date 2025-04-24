provider "huaweicloud" {
  region = var.region_name
}

module "dns_custom_line" {
  source = "../../modules/dns-custom-line"

  custom_line_name        = var.custom_line_name
  custom_line_ip_segments = var.custom_line_ip_segments
  custom_line_description = var.custom_line_description
}

module "dns_zone" {
  source = "../../modules/dns-zone"

  enterprise_project_id = var.enterprise_project_id
  zone_name             = var.zone_name
  zone_type             = "public"

  record_sets_configuration = [
    {
      name    = var.record_set_name
      type    = "A"
      records = var.record_set_records
      line_id = module.dns_custom_line.custom_line_id
    }
  ]
}
