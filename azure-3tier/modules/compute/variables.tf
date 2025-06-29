variable "resource_group" {
  type        = string
  description = "Name of the RG to deploy into"
}

variable "location" {
  type        = string
  description = "Azure region"
}

variable "subnet_ids" {
  type        = list(string)
  description = "List of subnet IDs for NICs"
}

variable "instance_count" {
  type        = number
  description = "Number of VM instances"
  default     = 2
}

variable "vm_size" {
  type        = string
  description = "Size of the VM (e.g. Standard_D2s_v3)"
}

variable "admin_username" {
  type        = string
  description = "Admin user for the VMs"
}

variable "admin_password" {
  type        = string
  sensitive   = true
  description = "Admin password for the VMs"
}

variable "image_publisher" {
  type        = string
  description = "Image publisher (e.g. Canonical)"
}

variable "image_offer" {
  type        = string
  description = "Image offer (e.g. UbuntuServer)"
}

variable "image_sku" {
  type        = string
  description = "Image SKU (e.g. 20_04-lts)"
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to compute resources"
}
