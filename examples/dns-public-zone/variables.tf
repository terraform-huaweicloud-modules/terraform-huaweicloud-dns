######################################################################
# Public configurations
######################################################################

variable "region_name" {
  type        = string
  description = "The region where the resources are located"
}

variable "enterprise_project_id" {
  type        = string
  description = "Used to specify whether the resource is created under the enterprise project (this parameter is only valid for enterprise users)"

  default = ""
}

######################################################################
# Configurations of DNS custom line resource
######################################################################

variable "custom_line_name" {
  type        = string
  description = "The name of the custom line"
}

variable "custom_line_ip_segments" {
  type        = list(string)
  description = "The list of the IP address ranges of the custom line"
}

variable "custom_line_description" {
  type        = string
  description = "The description of the custom line"

  default = ""
}

######################################################################
# Configurations of DNS public zone resource and related resources
######################################################################

variable "zone_name" {
  type        = string
  description = "The name of the public zone"
}

variable "record_set_name" {
  type        = string
  description = "The name of the public record set"
}

variable "record_set_records" {
  type        = list(string)
  description = "The list of the records of the public record set"
}
