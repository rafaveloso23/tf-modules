output "key_vault_access_policies" {
  description = "The access policies configured for the Key Vault."
  value       = var.access_policies != null ? var.access_policies : {}
}

output "current_object_id" {
  value = data.azurerm_client_config.current.object_id
}
