output "fqdn" {
  description = "DB host name (FQDN)"
  value       = azurerm_postgresql_flexible_server.this.fqdn
}

output "administrator_login" {
  description = "DB admin user"
  value       = azurerm_postgresql_flexible_server.this.administrator_login
}
