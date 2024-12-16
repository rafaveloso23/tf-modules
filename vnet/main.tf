# Use the determined resource group for dependent resources
resource "azurerm_virtual_network" "vnet_spoke" {
  name                = "vnet-spsoke"
  location            = var.rg_location
  resource_group_name = var.rg_name
  address_space       = ["10.1.0.0/16"]
}

resource "azurerm_subnet" "snet_spoke" {
  name                 = "subnet-spoke"
  resource_group_name  = var.rg_name
  virtual_network_name = azurerm_virtual_network.vnet_spoke.name
  address_prefixes     = ["10.1.0.0/24"]
}
