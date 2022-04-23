resource "azurerm_key_vault" "kv" {
  name                        = "kv-bkdo-store"
  location                    = var.location
  resource_group_name         = azurerm_resource_group.rg.name
  enabled_for_disk_encryption = true
  enable_rbac_authorization   = true
  enabled_for_deployment      = true
  tenant_id                   = var.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"

  tags = var.tags
}

resource "random_password" "mssql" {
  length           = 16
  special          = true
  upper            = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "azurerm_key_vault_secret" "mssql" {
  name         = "mssql-admin-password"
  value        = random_password.mssql.result
  key_vault_id = azurerm_key_vault.kv.id
}
