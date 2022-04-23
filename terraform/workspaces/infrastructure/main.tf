resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_application_insights" "appsvc" {
  name                = "appi-bdoiac-demo"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  application_type    = "web"
}

resource "azurerm_service_plan" "appsvc" {
  name                = "plan-bdoiac-demo"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  sku_name            = "S1"
  os_type             = "Windows"
}

resource "azurerm_windows_web_app" "appsvc" {
  name                = "app-bdoiac-demo"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  service_plan_id     = azurerm_service_plan.appsvc.id

  identity {
    type         = "UserAssigned"
    identity_ids = [azurerm_user_assigned_identity.ua_mi.id]
  }

  connection_string {
    name  = "sqlserver-conn-string"
    type  = "SQLAzure"
    value = ""

  }

  app_settings = {
    APPINSIGHTS_INSTRUMENTATIONKEY        = azurerm_application_insights.appsvc.instrumentation_key
    APPLICATIONINSIGHTS_CONNECTION_STRING = azurerm_application_insights.appsvc.connection_string
  }

  site_config {}
}

