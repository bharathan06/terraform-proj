variable "vnet_cidr" {
  description = "CIDR for the virtual network"
  type        = string
}

variable "public_subnet_cidr" {
  description = "CIDR for public subnet"
  type        = string
}

variable "private_subnet_cidr" {
  description = "CIDR for private subnet"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "resource_group" {
  description = "Azure resource group name"
  type        = string
}

variable "tags" {
  description = "Map of tags"
  type        = map(string)
}


