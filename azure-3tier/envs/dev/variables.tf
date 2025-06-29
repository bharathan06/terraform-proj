variable "resource_group" {
  description = "The name of the existing RG to deploy into"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "vnet_cidr" {
  description = "CIDR for the VNet"
  type        = string
}

variable "public_subnet_cidr" {
  description = "CIDR for the public subnet"
  type        = string
}

variable "private_subnet_cidr" {
  description = "CIDR for the private subnet"
  type        = string
}

variable "tags" {
  description = "Map of tags"
  type        = map(string)
}

variable "subscription_id" {
  description = "Azure Subscription ID to deploy into"
  type        = string
}

variable "tenant_id" {
  description = "Azure Tenant (Directory) ID"
  type        = string
}
