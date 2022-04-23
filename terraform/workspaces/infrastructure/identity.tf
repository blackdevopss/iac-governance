// Create Managed Identity used by App Service

resource "azurerm_user_assigned_identity" "ua_mi" {
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  name                = "mi-bdo-store"

  tags = var.tags
}

// Grant Managed Identity Permissions to read secrets from Key Vault

resource "azurerm_role_assignment" "kv" {
  for_each             = var.key_vault
  scope                = azurerm_key_vault.kv[each.key].id
  role_definition_name = "Key Vault Secrets Reader"
  principal_id         = azurerm_user_assigned_identity.ua_mi.principal_id
}

