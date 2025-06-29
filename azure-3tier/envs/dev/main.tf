//Main file for the dev environment of the 3-tier architecture on Azure


//Tier - 1 Networking : This module sets up the networking components including virtual network and subnets
module "network" {
  source              = "../../modules/network"
  vnet_cidr           = var.vnet_cidr
  public_subnet_cidr  = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
  location            = var.location
  resource_group      = var.resource_group
  tags                = var.tags
}


//Tier - 2 Compute : This module provisions the compute resources such as virtual machines
module "compute" {
  source        = "../../modules/compute"
  resource_group = var.resource_group
  location       = var.location
  subnet_ids     = [ module.network.public_subnet_id, module.network.private_subnet_id ]

  instance_count  = var.instance_count
  vm_size         = var.vm_size
  admin_username  = var.admin_username
  admin_password  = var.admin_password

  image_publisher = var.image_publisher
  image_offer     = var.image_offer
  image_sku       = var.image_sku

  tags            = var.tags
}


//Tier - 3 Database : This module sets up the database resources. 
module "database" {
  source                 = "../../modules/database"

  resource_group         = var.resource_group
  location               = var.location
  subnet_id              = module.network.private_subnet_id

  sku_name               = var.sku_name
  storage_mb             = var.storage_mb
  db_version             = var.db_version

  administrator_login    = var.administrator_login
  administrator_password = var.db_admin_password

  tags                   = var.tags
}


