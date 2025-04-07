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

variable "vpc_name" {
  type        = string
  description = "The name of the VPC to which the endpoint belongs"
}

variable "vpc_cidr" {
  type        = string
  description = "The CIDR block of the VPC to which the endpoint belongs"
}

variable "subnets_configuration" {
  type = list(object({
    name = string
    cidr = string
  }))

  description = "The configuration for the subnets to which the endpoint belongs"
}

######################################################################
# Configurations endpoint resource
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
