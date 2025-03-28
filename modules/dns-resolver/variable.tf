######################################################################
# Configurations of endpoint resource
######################################################################

variable "is_endpoint_create" {
  type        = bool
  description = "Controls whether a endpoint should be created"

  default  = true
  nullable = false
}

variable "endpoint_name" {
  type        = string
  description = "The name of the endpoint"

  default = ""
}

variable "endpoint_type" {
  type        = string
  description = "The type of the endpoint"

  default = ""
}

variable "endpoint_assignments" {
  type = list(object({
    subnet_id  = string
    ip_address = string
  }))
  description = "The list of the IP addresses of the endpoint"

  default  = []
  nullable = false
}

######################################################################
# Configurations of the resolver rule resources and related resources
######################################################################

variable "resolver_rules_configuration" {
  type = list(object({
    endpoint_id  = optional(string, "")
    name         = string
    domain_name  = string
    ip_addresses = list(string)
    vpc_ids      = optional(list(string), [])
  }))

  description = "The configuration list of the resolver rules and and the VPCs to associate with them"
  default     = []
  nullable    = false
}

variable "resolver_rule_associates_configuration" {
  type = list(object({
    resolver_rule_id = string
    vpc_id           = string
  }))

  description = "The configuration of the resolver rules associated with VPCs"
  default     = []
  nullable    = false
}
