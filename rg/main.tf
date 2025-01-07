resource "azurerm_resource_group" "rg_hub" {
  # for_each = var.rg_novo ? { "new" = "${var.name}" } : {}
  name     = var.name
  location = var.location
}
