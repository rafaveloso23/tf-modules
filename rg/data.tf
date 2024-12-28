data "azurerm_resource_group" "rg_data" {
  for_each = var.rg_existente ? { "existing" = "${var.name}" } : {}
  name     = each.value
}