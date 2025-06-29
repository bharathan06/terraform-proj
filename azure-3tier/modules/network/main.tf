//HCL code to setup the networking components for a 3-tier architecture on cloud 

resource "azurerm_virtual_network" "this" {
  name                = "${var.tags["env"]}-vnet"
  address_space       = [var.vnet_cidr]
  location            = var.location
  resource_group_name = var.resource_group
  tags                = var.tags
}

resource "azurerm_subnet" "public" {
  name                 = "${var.tags["env"]}-public-subnet"
  resource_group_name  = var.resource_group
  virtual_network_name = azurerm_virtual_network.this.name
  address_prefixes     = [var.public_subnet_cidr]
}

resource "azurerm_subnet" "private" {
  name                 = "${var.tags["env"]}-private-subnet"
  resource_group_name  = var.resource_group
  virtual_network_name = azurerm_virtual_network.this.name
  address_prefixes     = [var.private_subnet_cidr]

  # Enable the PostgreSQL service endpoint
  service_endpoints = [
    "Microsoft.DBforPostgreSQL/flexibleServers"
  ]

  # Delegate the subnet to the server
  delegation {
    name = "${var.tags["env"]}-db-delegation"
    service_delegation {
      name    = "Microsoft.DBforPostgreSQL/flexibleServers"
      actions = [
        "Microsoft.Network/virtualNetworks/subnets/join/action"
      ]
    }
  }
}


resource "azurerm_network_security_group" "public" {
  name                = "${var.tags["env"]}-public-nsg"
  location            = var.location
  resource_group_name = var.resource_group
  tags                = var.tags
}

resource "azurerm_network_security_group" "private" {
  name                = "${var.tags["env"]}-private-nsg"
  location            = var.location
  resource_group_name = var.resource_group
  tags                = var.tags
}

resource "azurerm_subnet_network_security_group_association" "public" {
  subnet_id                 = azurerm_subnet.public.id
  network_security_group_id = azurerm_network_security_group.public.id
}

resource "azurerm_subnet_network_security_group_association" "private" {
  subnet_id                 = azurerm_subnet.private.id
  network_security_group_id = azurerm_network_security_group.private.id
}

resource "azurerm_public_ip" "nat_gateway_ip" {
  name                = "${var.tags["env"]}-nat-ip"
  location            = var.location
  resource_group_name = var.resource_group
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_nat_gateway" "this" {
  name                = "${var.tags["env"]}-nat-gateway"
  location            = var.location
  resource_group_name = var.resource_group
  sku_name            = "Standard"

  idle_timeout_in_minutes = 4
  tags                    = var.tags
}

resource "azurerm_nat_gateway_public_ip_association" "this" {
  nat_gateway_id        = azurerm_nat_gateway.this.id
  public_ip_address_id  = azurerm_public_ip.nat_gateway_ip.id
}

resource "azurerm_subnet_nat_gateway_association" "private" {
  subnet_id      = azurerm_subnet.private.id
  nat_gateway_id = azurerm_nat_gateway.this.id
}
