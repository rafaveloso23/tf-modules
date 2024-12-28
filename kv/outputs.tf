output "key_vault_name" {
  description = "The name of the Key Vault."
  value       = local.key_vault_name
}

output "key_vault_id" {
  description = "The ID of the Key Vault."
  value       = var.kv_novo ? azurerm_key_vault.kv["new"].id : data.azurerm_key_vault.kv["existing"].id
}

output "key_vault_location" {
  description = "The location of the Key Vault."
  value       = var.kv_novo ? azurerm_key_vault.kv["new"].location : data.azurerm_key_vault.kv["existing"].location
}
