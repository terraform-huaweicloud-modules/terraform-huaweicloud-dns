######################################################################
# Public configurations
######################################################################

variable "enterprise_project_id" {
  description = "Used to specify whether the resource is created under the enterprise project (this parameter is only valid for enterprise users)"

  type    = string
  default = ""
}

######################################################################
# Configurations of DNS ptrrecord resource
######################################################################

variable "is_ptrrecord_create" {
  type        = bool
  description = "Controls whether a PTR record should be created"

  default  = true
  nullable = false
}

variable "ptrrecord_name" {
  type        = string
  description = "The domain name of the PTR record"

  default = ""
}

variable "ptrrecord_floatingip_id" {
  type        = string
  description = "The ID of the GEIP/EIP"

  default = ""
}

variable "ptrrecord_ttl" {
  type        = number
  description = "The TTL of the PTR record"

  default = null
}

variable "ptrrecord_description" {
  type        = string
  description = "The description of the PTR record"

  default = ""
}

variable "ptrrecord_tags" {
  type        = map(string)
  description = "The key/value pairs to associate with the PTR record"

  default = {}
}
