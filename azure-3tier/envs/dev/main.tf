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
