data "azurerm_client_config" "current" {}

resource "azurerm_resource_group" "example" {
  name     = "rg-teste-kv"
  location = "eastus2"
}

resource "azurerm_key_vault" "example" {
  name                        = "rvskvsdsss"
  location                    = azurerm_resource_group.example.location
  resource_group_name         = azurerm_resource_group.example.name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Get", "List", "Update", "Create", "Purge", "Delete"
    ]

    secret_permissions = [
      "Get","Set","List", "Delete", "Purge", "Recover"
    ]

    storage_permissions = [
      "Get",
    ]
  }
}

resource "azurerm_key_vault_secret" "example" {
  name         = "secret-sauce"
  value        = azuread_application_password.example.value
  key_vault_id = azurerm_key_vault.example.id

  depends_on = [ azurerm_key_vault.example ]
}

resource "azuread_application_registration" "example" {
  display_name = "examplervs"
}

resource "time_rotating" "example" {
  rotation_days  = 730
  #rotation_minutes = 4
}

resource "azuread_application_password" "example" {
  application_id = azuread_application_registration.example.id
  #end_date = timestamp()
  rotate_when_changed = {
    rotation = time_rotating.example.id
  }
}