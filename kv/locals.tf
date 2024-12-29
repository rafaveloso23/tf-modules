locals {
  key_vault_name = var.kv_novo ? azurerm_key_vault.kv["new"].name : data.azurerm_key_vault.kv["existing"].name
  key_vault_id   = var.kv_novo ? azurerm_key_vault.kv["new"].id : data.azurerm_key_vault.kv["existing"].id
}
