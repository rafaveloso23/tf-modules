resource "azurerm_key_vault" "kv" {
  for_each                    = var.kv_novo ? { "new" = "${var.name}" } : {}
  name                        = each.value
  location                    = var.location
  resource_group_name         = var.rg_name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = var.soft_delete_retention_days
  purge_protection_enabled    = var.purge_protection_enabled
  sku_name                    = var.sku_name
}

resource "azurerm_key_vault_access_policy" "example" {
  for_each = var.access_policies != null ? var.access_policies : {}
  key_vault_id = local.key_vault_id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = each.value.object_id

  key_permissions    = each.value.key_permissions
  secret_permissions = each.value.secret_permissions

  depends_on = [ azurerm_key_vault_access_policy.current ]
}

resource "azurerm_key_vault_access_policy" "current" {
  for_each = (!var.is_object_id_in_list && (var.kv_novo || var.kv_existente)) ? { "new" = local.key_vault_name } : {}

  key_vault_id = local.key_vault_id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = data.azurerm_client_config.current.object_id

  key_permissions         = ["Get", "List", "Import"]
  secret_permissions      = ["Get", "List", "Set", "Purge", "Delete"]
  certificate_permissions = ["Get", "List", "Import"]
}

resource "azurerm_key_vault_secret" "new" {
  for_each = var.kv_secret_new && var.kv_secrets != null ? var.kv_secrets : {}

  name         = each.value.name
  value        = each.value.value
  key_vault_id = local.key_vault_id

  depends_on = [ azurerm_key_vault_access_policy.example ]
}

data "azurerm_key_vault_secret" "existing" {
  for_each = var.kv_secret_get && var.kv_secrets != null ? var.kv_secrets : {}

  name         = each.value.name
  key_vault_id = local.key_vault_id

  depends_on = [ azurerm_key_vault_access_policy.example ]
}
