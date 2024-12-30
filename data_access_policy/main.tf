data "azurerm_key_vault" "acces_policy" {
  name                = var.name
  resource_group_name = var.rg_name
}

data "azurerm_client_config" "current" {}

output "acces_policy" {
  value = data.azurerm_key_vault.acces_policy.access_policy
}

output "object_ids" {
  value = [for policy in data.azurerm_key_vault.acces_policy.access_policy : policy.object_id]
}

locals {
  is_object_id_in_list = contains(
    [for policy in data.azurerm_key_vault.acces_policy.access_policy : policy.object_id],
    data.azurerm_client_config.current.object_id
  )
}

output "is_object_id_in_list" {
  value = local.is_object_id_in_list
}