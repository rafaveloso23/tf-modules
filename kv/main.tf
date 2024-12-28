resource "azurerm_key_vault" "kv" {
  for_each = var.kv_novo ? { "new" = "${var.name}" } : {}
  name                        = each.value
  location                    = var.location
  resource_group_name         = var.rg_name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = var.soft_delete_retention_days
  purge_protection_enabled    = var.purge_protection_enabled
  sku_name                    = var.sku_name
}