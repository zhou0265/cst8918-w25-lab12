resource "azurerm_resource_group" "app_rg" {
  name     = "team16-a12-rg"
  location = "eastus"
}
resource "azurerm_virtual_network" "main_vnet" {
  name                = "app-vnet"
  resource_group_name = azurerm_resource_group.app_rg.name
  location            = azurerm_resource_group.app_rg.location
  address_space       = ["10.0.0.0/16"]

  tags = {
    Environment = "Lab12"
  }
}

resource "azurerm_subnet" "subnet1" {
  name                 = "subnet-1"
  resource_group_name  = azurerm_resource_group.app_rg.name
  virtual_network_name = azurerm_virtual_network.main_vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}
