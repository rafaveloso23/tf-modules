output "resource_group_name" {
  description = "The name of the resource group created or retrieved."
  value       = azurerm_resource_group.rg_hub.name
}

output "id" {
  description = "The name of the resource group created or retrieved."
  value       = azurerm_resource_group.rg_hub.id
}

output "resource_group_location" {
  description = "The location of the resource group created or retrieved."
  value       = azurerm_resource_group.rg_hub.location
}

# output "resource_group_id" {
#   description = "The ID of the resource group created or retrieved."
#   value = var.rg_novo ? azurerm_resource_group.rg_hub["new"].id : data.azurerm_resource_group.rg_data["existing"].id
# }

# output "is_new_resource_group" {
#   description = "Indicates if a new resource group was created."
#   value       = var.rg_novo
# }

# output "existing_resource_group_used" {
#   description = "Indicates if an existing resource group was used."
#   value       = var.rg_existente
# }
