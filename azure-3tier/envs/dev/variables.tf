//network variables :  

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


//Compute variables :

variable "admin_username" {
  type = string 
  description = "Admin username for the VMs"
}

variable "admin_password" {
  type      = string
  sensitive = true
}

variable "instance_count" {
  type    = number
  default = 2
}

variable "vm_size" {
  type    = string
}

variable "image_publisher" {
  type = string
}

variable "image_offer" {
  type = string
}

variable "image_sku" {
  type = string
}



//Database variables : 
variable "sku_name" {
  description = "DB SKU for PostgreSQL Flexible Server"
  type        = string
}

variable "storage_mb" {
  description = "DB storage in MB"
  type        = number
}

variable "db_version" {
  description = "PostgreSQL version"
  type        = string
}

variable "administrator_login" {
  description = "DB admin username"
  type        = string
}

variable "db_admin_password" {
  description = "DB admin password"
  type        = string
  sensitive   = true
}

variable "administrator_password" {
  description = "Admin password for the PostgreSQL flexible server"
  type        = string
  sensitive   = true
}

