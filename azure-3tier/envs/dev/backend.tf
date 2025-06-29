//Terraform configuration file for the dev environment

terraform {
  backend "azurerm" {
    resource_group_name  = "rg-tfstate"
    storage_account_name = "burten"
    container_name       = "tfstate"
    key                  = "dev.terraform.tfstate"
  }
}
