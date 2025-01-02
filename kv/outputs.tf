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

output "key_vault_access_policies" {
  description = "The access policies configured for the Key Vault."
  value       = var.access_policies != null ? var.access_policies : {}
}

output "new_secrets" {
  description = "List of newly created secrets and their details."
  value       = { for k, v in azurerm_key_vault_secret.new : k => v.id if var.kv_secret_new }
}

output "existing_secrets" {
  description = "Values of fetched secrets from the existing Key Vault."
  value       = { for k, v in data.azurerm_key_vault_secret.existing : k => v.value if var.kv_secret_get }
}

output "current_object_id" {
  value = data.azurerm_client_config.current.object_id
}

output "acces_policy" {
  value = var.kv_existente ? data.azurerm_key_vault.kv["existing"].access_policy : []
}