resource "azurerm_postgresql_flexible_server" "this" {
  name                   = "${var.tags["env"]}-pgflex"
  resource_group_name    = var.resource_group
  location               = var.location
  version                = var.db_version
  delegated_subnet_id    = var.subnet_id

  sku_name               = var.sku_name
  storage_mb             = var.storage_mb

  administrator_login         = var.administrator_login
  administrator_password      = var.administrator_password

  backup_retention_days        = 7
  geo_redundant_backup_enabled = false

  tags = var.tags
}

resource "azurerm_postgresql_flexible_server_firewall_rule" "azure_services" {
  name             = "allow_azure_services"
  server_id        = azurerm_postgresql_flexible_server.this.id
  start_ip_address = "0.0.0.0"
  end_ip_address   = "0.0.0.0"
}
