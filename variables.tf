variable "resource_location" {
  description = "Azure location where the resources deployed."
  type        = string
}

variable "resource_group_name" {
  type = string
}

variable "vnet_name" {
  description = "The abbreviated name of the vnet."
  type        = string
}

variable "vnet_cidr" {
  type = string
}

variable "environment_tag" {
  description = "The type of environment being deployed to (e.g. test, prod)."
  type        = string
}