terraform {
  backend "azurerm" {}
}

provider "azurerm" {
  features {}
}

module "network" {
  source              = "./modules/network"
  resource_location   = var.resource_location
  resource_group_name = var.resource_group_name
  environment_tag     = var.environment_tag
  vnet_name           = var.vnet_name
  vnet_cidr           = var.vnet_cidr
}

module "database" {
  source              = "./modules/database"
  resource_location   = var.resource_location
  resource_group_name = var.resource_group_name
  environment_tag     = var.environment_tag
  subnet_id           = module.network.subnet_id
  depends_on = [
    module.network
  ]
}

module "web_app" {
  source              = "./modules/web_app"
  resource_location   = var.resource_location
  resource_group_name = var.resource_group_name
  environment_tag     = var.environment_tag
  subnet_id           = module.network.subnet_id
  depends_on = [
    module.network, module.database
  ]

}
