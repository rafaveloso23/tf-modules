resource "azurerm_resource_group" "example" {
  name     = var.rg_name
  location = var.rg_location
}

resource "azurerm_storage_account" "example" {
  name                     = "stgrvsjskdadfs"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "lrs"
}

resource "azurerm_storage_container" "example" {
  name                  = "vhds"
  storage_account_id    = azurerm_storage_account.example.id
  container_access_type = "private"
}