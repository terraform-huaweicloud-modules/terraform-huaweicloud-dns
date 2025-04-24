######################################################################
# Configurations of DNS custom line resource
######################################################################

variable "is_custom_line_create" {
  type        = bool
  description = "Controls whether a custom line should be created"

  default  = true
  nullable = false
}

variable "custom_line_name" {
  type        = string
  description = "The name of the custom line"

  default = ""
}

variable "custom_line_ip_segments" {
  type        = list(string)
  description = "The list of the IP address ranges of the custom line"

  default  = []
  nullable = false
}

variable "custom_line_description" {
  type        = string
  description = "The description of the custom line"

  default = ""
}
