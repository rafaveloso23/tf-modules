data "azurerm_key_vault" "kv" {
  for_each = var.kv_existente ? { "existing" = "${var.name}" } : {}
  name                = each.value
  resource_group_name = var.rg_name
}