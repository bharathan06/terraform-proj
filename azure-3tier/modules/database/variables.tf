variable "resource_group" {
  description = "Name of the RG to deploy into"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "subnet_id" {
  description = "ID of the private subnet where DB will sit"
  type        = string
}

variable "sku_name" {
  description = "Compute SKU (e.g. Standard_D4s_v3)"
  type        = string
}

variable "storage_mb" {
  description = "Storage size in MB"
  type        = number
}

variable "db_version" {
  description = "PostgreSQL version (e.g. 13)"
  type        = string
}

variable "administrator_login" {
  description = "DB admin username"
  type        = string
}

variable "administrator_password" {
  description = "DB admin password"
  type        = string
  sensitive   = true
}

variable "tags" {
  description = "Tags map"
  type        = map(string)
}

