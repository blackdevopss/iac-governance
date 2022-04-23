output "instrumentation_key" {
  value     = azurerm_application_insights.appsvc.instrumentation_key
  sensitive = true
}

output "app_id" {
  value = azurerm_application_insights.appsvc.app_id
}

output "kv_id" {
  value = tomap({
    for k, kv in azurerm_key_vault.kv : k => {
      id = kv.id
    }
  })
}

output "random_pwd_result" {
  value = tomap({
    for rp, rpwd in random_password.rpwd : rp => {
      result = rpwd.result
    }
  })
  sensitive = true
}

output "mssql_server_id" {
  value = tomap({
    for server, mssql in azurerm_mssql_server.mssql : server => {
      server_id = mssql.id
    }
  })
}