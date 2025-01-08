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
