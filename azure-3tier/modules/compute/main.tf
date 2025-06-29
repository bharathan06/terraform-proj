#Public IP for LB
resource "azurerm_public_ip" "lb_ip" {
  name                = "${var.tags["env"]}-lb-pip"
  location            = var.location
  resource_group_name = var.resource_group
  allocation_method   = "Static"
  sku                 = "Standard"
  tags                = var.tags
}

#Load Balancer
resource "azurerm_lb" "this" {
  name                = "${var.tags["env"]}-lb"
  location            = var.location
  resource_group_name = var.resource_group
  sku                 = "Standard"
  frontend_ip_configuration {
    name                 = "LoadBalancerFrontEnd"
    public_ip_address_id = azurerm_public_ip.lb_ip.id
  }
  tags = var.tags
}

#Health Probe
resource "azurerm_lb_probe" "http" {
  name                = "http-probe"
  loadbalancer_id     = azurerm_lb.this.id
  protocol            = "Http"
  port                = 80
  request_path        = "/"
  interval_in_seconds = 15
  number_of_probes    = 2
}

#Backend Pool
resource "azurerm_lb_backend_address_pool" "this" {
  name                = "backend-pool"
  loadbalancer_id     = azurerm_lb.this.id
}

#VM Scale Set
resource "azurerm_linux_virtual_machine_scale_set" "this" {
  name                = "${var.tags["env"]}-vmss"
  location            = var.location
  resource_group_name = var.resource_group
  sku                 = var.vm_size
  instances           = var.instance_count
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  source_image_reference {
    publisher = var.image_publisher
    offer     = var.image_offer
    sku       = var.image_sku
    version   = "latest"
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  network_interface {
    name    = "nic"
    primary = true
    ip_configuration {
      name                                   = "ipconfig"
      subnet_id                              = var.subnet_ids[0]
      load_balancer_backend_address_pool_ids = [azurerm_lb_backend_address_pool.this.id]
    }
  }

  health_probe_id = azurerm_lb_probe.http.id
  overprovision   = false
  tags            = var.tags
}
