// Create Managed Identity used by App Service

resource "azurerm_user_assigned_identity" "ua_mi" {
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  name                = "mi-bdoiac-store"

  tags = var.tags
}

// Grant Managed Identity Permissions to read secrets from Key Vault


