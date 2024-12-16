# # Create a new resource group if rg_novo is true
# resource "azurerm_resource_group" "rg_hub_dev" {
#   for_each = var.rg_novo ? { "new" = "${var.rg_name}-${var.environment}" } : {}
#   name     = each.value
#   location = var.rg_location
# }

# # Reference an existing resource group if rg_existente is true
# data "azurerm_resource_group" "rg_data_dev" {
#   for_each = var.rg_existente ? { "existing" = "${var.rg_name}-${var.environment}" } : {}
#   name     = each.value
# }

# # Determine the resource group name and location dynamically
# locals {
#   resource_group_name = var.rg_novo ? azurerm_resource_group.rg_hub_dev["new"].name : data.azurerm_resource_group.rg_data_dev["existing"].name
#   resource_group_location = var.rg_novo ? azurerm_resource_group.rg_hub_dev["new"].location : data.azurerm_resource_group.rg_data_dev["existing"].location
# }

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
