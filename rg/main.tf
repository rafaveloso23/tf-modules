resource "azurerm_resource_group" "rg_hub" {
  for_each = var.rg_novo ? { "new" = "${var.name}" } : {}
  name     = each.value
  location = var.location
}
