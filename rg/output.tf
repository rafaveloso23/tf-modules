output "existing_rg_name" {
  value = try(data.azurerm_resource_group.rg_data_dev["existing"].name, null)
}