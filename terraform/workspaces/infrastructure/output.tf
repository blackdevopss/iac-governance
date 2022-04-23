output "instrumentation_key" {
  value     = azurerm_application_insights.appsvc.instrumentation_key
  sensitive = true
}

output "app_id" {
  value = azurerm_application_insights.appsvc.app_id
}