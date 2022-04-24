resource "azurerm_application_insights" "appi" {
  name                = each.value.application_insights_name
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  application_type    = each.value.application_insights_application_type

  tags = var.tags
}

resource "azurerm_service_plan" "appsvc" {
  for_each            = var.app_service_plan
  name                = each.key
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  sku_name            = each.value.sku_name
  os_type             = each.value.os_type

  tags = var.tags
}

resource "azurerm_windows_web_app" "appsvc" {
  name                = each.value.web_app_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  service_plan_id     = azurerm_service_plan.appsvc[each.key].id

  identity {
    type = "SystemAssigned"
  }

  app_settings = {
    APPINSIGHTS_INSTRUMENTATIONKEY        = azurerm_application_insights.appsvc[each.value.application_insights_name].instrumentation_key
    APPLICATIONINSIGHTS_CONNECTION_STRING = azurerm_application_insights.appsvc[each.value.application_insights_name].connection_string
  }

  site_config {}

  tags = var.tags
}
