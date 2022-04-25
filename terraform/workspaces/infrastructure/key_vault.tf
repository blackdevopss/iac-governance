resource "azurerm_key_vault" "kv" {
  for_each                    = var.key_vault
  name                        = each.key
  location                    = each.value.location
  resource_group_name         = azurerm_resource_group.rg.name
  enabled_for_disk_encryption = each.value.enabled_for_disk_encryption
  enable_rbac_authorization   = each.value.enable_rbac_authorization
  enabled_for_deployment      = each.value.enabled_for_deployment
  tenant_id                   = each.value.tenant_id
  soft_delete_retention_days  = each.value.soft_delete_retention_days
  purge_protection_enabled    = each.value.purge_protection_enabled

  sku_name = each.value.sku_name

  tags = var.tags
}

resource "random_password" "rpwd" {
  for_each         = var.passwords
  length           = each.value.length
  special          = each.value.special
  upper            = each.value.upper
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "azurerm_key_vault_secret" "mssql" {
  for_each     = var.key_vault
  name         = "mssql-admin-password"
  value        = random_password.rpwd["sqlserver"].result
  key_vault_id = azurerm_key_vault.kv[each.key].id
}


