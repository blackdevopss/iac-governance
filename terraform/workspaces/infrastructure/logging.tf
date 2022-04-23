resource "azurerm_storage_account" "st" {
  name                     = "stbdodiaglogging"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = var.tags
}

resource "azurerm_log_analytics_workspace" "loga" {
  name                = "loga-bdo-store"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}

