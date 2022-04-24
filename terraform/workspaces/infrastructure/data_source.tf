// APPLICATION INSIGHTS
data "azurerm_application_insights" "appi" {
  name                = "appi-bdoiac-demo"
  resource_group_name = "rg-bdoiac-demo"

  depends_on = [
    azurerm_application_insights.appi
  ]
}

output "application_insights_instrumentation_key" {
  value = data.azurerm_application_insights.appi.instrumentation_key
}

output "application_insights_connection_string" {
  value = data.azurerm_application_insights.appi.connection_string

  sensitive = true
}


