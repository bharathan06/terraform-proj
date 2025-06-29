//

output "vnet_id" {
  value = azurerm_virtual_network.this.id
}

output "public_subnet_id" {
  value = azurerm_subnet.public.id
}

output "private_subnet_id" {
  value = azurerm_subnet.private.id
}

output "nsg_public_id" {
  value = azurerm_network_security_group.public.id
}

output "nsg_private_id" {
  value = azurerm_network_security_group.private.id
}
