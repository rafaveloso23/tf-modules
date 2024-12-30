output "acces_policy" {
  value = var.kv_existente ? data.azurerm_key_vault.kv["existing"].access_policy : []
}

output "object_ids" {
  value = var.kv_existente ? [for policy in data.azurerm_key_vault.kv["existing"].access_policy : policy.object_id] : []
}

locals {
  is_object_id_in_list = var.kv_existente && contains(
    [for policy in data.azurerm_key_vault.kv["existing"].access_policy : policy.object_id],
    data.azurerm_client_config.current.object_id
  )
}



output "is_object_id_in_list" {
  value = local.is_object_id_in_list
}