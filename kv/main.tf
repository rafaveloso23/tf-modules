# Create a new resource group if rg_novo is true
resource "azurerm_resource_group" "rg_hub" {
  for_each = var.rg_novo ? { "new" = "${var.rg_name}-${var.environment}" } : {}
  name     = each.value
  location = var.rg_location
}

# Reference an existing resource group if rg_existente is true
data "azurerm_resource_group" "rg_data" {
  for_each = var.rg_existente ? { "existing" = "${var.rg_name}-${var.environment}" } : {}
  name     = each.value
}

# Determine the resource group name and location dynamically
locals {
  resource_group_name = var.rg_novo ? azurerm_resource_group.rg_hub["new"].name : data.azurerm_resource_group.rg_data["existing"].name
  resource_group_location = var.rg_novo ? azurerm_resource_group.rg_hub["new"].location : data.azurerm_resource_group.rg_data["existing"].location
}

# Use the determined resource group for dependent resources
resource "azurerm_key_vault" "kv" {
  name                        = "kvactions-${var.environment}"
  location                    = loca.resource_group_location
  resource_group_name         = local.resource_group_name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = var.soft_delete_retention_days
  purge_protection_enabled    = var.purge_protection_enabled

  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Get",
    ]

    secret_permissions = [
      "Get",
    ]

    storage_permissions = [
      "Get",
    ]
  }
}