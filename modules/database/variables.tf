variable "resource_location" {
  description = "Azure location where the resources deployed."
  type        = string
  default     = "Australia East"
}

variable "resource_group_name" {
  type = string
}

variable "environment_tag" {
  description = "The type of environment being deployed to (e.g. test, prod)."
  type        = string
}

variable "subnet_id" {
  type = string
}