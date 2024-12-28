
locals {
  key_vault_name = var.kv_novo ? azurerm_key_vault.kv["new"].name : data.azurerm_key_vault.kv["existing"].name
}
