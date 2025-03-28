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
# Configurations of VPC resource and related resources
######################################################################

variable "vpc_network_configurations" {
  type = list(object({
    vpc_name = string
    vpc_cidr = string
    subnets_configuration = list(object({
      name = string
      cidr = string
    }))
  }))

  description = "The configuration VPCs and subnets to which the endpoint or resolver rule belongs"
}

######################################################################
# Configurations of the zone resource
######################################################################

variable "zone_name" {
  type        = string
  description = "The name of the DNS zone, this parameter is optional when endpoint_type is inbound"

  default = ""
}

variable "zone_type" {
  type        = string
  description = "The type of the DNS zone, this parameter is optional when endpoint_type is inbound"

  default = null
}

######################################################################
# Configurations endpoint resource and related resources
######################################################################

variable "endpoint_name" {
  type        = string
  description = "The name of the endpoint"
}

variable "endpoint_type" {
  type        = string
  description = "The type of the endpoint"
}

variable "endpoint_ip_addresses" {
  type = list(string)

  description = "The list of the IP addresses of the endpoint"
}

variable "resolver_rules_configuration" {
  type = list(object({
    name         = string
    ip_addresses = list(string)
  }))

  description = "The basic configuration of the resolver rules, this parameter is optional when endpoint_type is inbound"
  default     = []
}
