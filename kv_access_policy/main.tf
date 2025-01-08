resource "azurerm_key_vault_access_policy" "example" {
  for_each = var.access_policies != null ? var.access_policies : {}

  key_vault_id            = var.key_vault_id
  tenant_id               = data.azurerm_client_config.current.tenant_id
  object_id               = each.value.object_id
  key_permissions         = each.value.key_permissions
  secret_permissions      = each.value.secret_permissions
  certificate_permissions = each.value.certificate_permissions

  depends_on = [azurerm_key_vault_access_policy.current]
}

resource "azurerm_key_vault_access_policy" "current" {
  for_each = { "default" = var.specific_object_id }

  key_vault_id = var.key_vault_id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = var.specific_object_id

  key_permissions         = ["Get", "List", "Import"]
  secret_permissions      = ["Get", "Set", "Purge", "Delete", "List"]
  certificate_permissions = ["Get", "List", "Import"]
}
