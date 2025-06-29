output "lb_public_ip" {
  description = "Public IP of the Load Balancer"
  value       = azurerm_public_ip.lb_ip.ip_address
}

output "vmss_id" {
  description = "ID of the VM Scale Set"
  value       = azurerm_linux_virtual_machine_scale_set.this.id
}
