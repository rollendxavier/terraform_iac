# Resource Group
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.resource_location
}

#Virtual Network
resource "azurerm_virtual_network" "demo_vnet" {
  name                = "${var.vnet_name}-vnet"
  location            = var.resource_location
  resource_group_name = var.resource_group_name
  address_space       = [var.vnet_cidr]

  tags = {
    environment = var.environment_tag
  }
  depends_on = [
    azurerm_resource_group.rg
  ]
}

#Subnet
resource "azurerm_subnet" "demo_subnet" {
  name                 = "tf-subnet"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.demo_vnet.name
  address_prefixes     = ["10.0.1.0/24"]
  service_endpoints    = ["Microsoft.Sql"]

  delegation {
    name = "vnet-delegation"

    service_delegation {
      name    = "Microsoft.Web/serverFarms"
      actions = ["Microsoft.Network/virtualNetworks/subnets/action"]
    }
  }
    depends_on = [
    azurerm_resource_group.rg, azurerm_virtual_network.demo_vnet
  ]
}