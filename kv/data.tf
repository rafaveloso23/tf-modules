data "azurerm_key_vault" "kv" {
  for_each = var.kv_existente ? { "existing" = "${var.name}" } : {}
  name                = each.value
  resource_group_name = var.rg_name
}

data "azurerm_key_vault_secret" "existing" {
  for_each = var.kv_secret_get && var.kv_secrets != null ? var.kv_secrets : {}

  name         = each.value.name
  key_vault_id = local.key_vault_id

  depends_on = [ azurerm_key_vault_access_policy.example ]
}

data "azurerm_client_config" "current" {}