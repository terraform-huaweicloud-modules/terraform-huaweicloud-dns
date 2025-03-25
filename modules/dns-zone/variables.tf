######################################################################
# Public configurations
######################################################################

variable "enterprise_project_id" {
  description = "Used to specify whether the resource is created under the enterprise project (this parameter is only valid for enterprise users)"

  type    = string
  default = ""
}

######################################################################
# Configurations of DNS zone resource
######################################################################

variable "is_zone_create" {
  type        = bool
  description = "Controls whether a zone should be created"

  default  = true
  nullable = false
}

variable "zone_name" {
  type        = string
  description = "The name of the zone"

  default = ""
}

variable "zone_email" {
  type        = string
  description = "The email of the zone"

  default = ""
}

variable "zone_description" {
  type        = string
  description = "The description of the zone"

  default = ""
}

variable "zone_ttl" {
  type        = number
  description = "The ttl of the zone"

  default = 300
}

variable "zone_type" {
  type        = string
  description = "The type of the zone"

  default = "public"
}

variable "zone_status" {
  type        = string
  description = "The status of the zone"

  default = ""
}

variable "zone_tags" {
  type        = map(string)
  description = "The key/value pairs to associate with the zone"

  default = {}
}

variable "zone_proxy_pattern" {
  type        = string
  description = "The recursive resolution proxy mode for subdomains of the private zone, available when zone_type is private"

  default = ""
}

variable "zone_routers" {
  type = list(object({
    router_id     = string
    router_region = optional(string, null)
  }))
  description = "The list of the routers of the zone, required when zone_type id private"

  default = []
}

######################################################################
# Configurations of DNS record set resources
######################################################################

variable "record_sets_configuration" {
  type = list(object({
    zone_id     = optional(string, "")
    name        = string
    type        = string
    records     = list(string)
    ttl         = optional(number, 300)
    line_id     = optional(string, "")
    status      = optional(string, "")
    tags        = optional(map(string), {})
    description = optional(string, "")
    weight      = optional(number, null)
  }))
  description = "The configuration for the record set resources to which the zone belongs"

  default  = []
  nullable = false
}
