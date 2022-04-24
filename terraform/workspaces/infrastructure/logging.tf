resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location

  tags = var.tags
}

resource "azurerm_storage_account" "st" {
  for_each                 = var.diagnostic_logging
  name                     = each.value.storage_account_name
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = var.location
  account_tier             = each.value.storage_account_tier
  account_replication_type = each.value.storage_account_replication_type

  tags = var.tags
}

resource "azurerm_log_analytics_workspace" "loga" {
  for_each            = var.diagnostic_logging
  name                = each.log_analytics_workspace_name
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  sku                 = each.log_analytics_workspace_sku
  retention_in_days   = each.azurerm_log_analytics_workspace_retention_in_days

  tags = var.tags
}

