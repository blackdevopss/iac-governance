resource "azurerm_mssql_server" "mssql" {
  for_each                     = var.sqlServers
  name                         = each.key
  resource_group_name          = azurerm_resource_group.rg.name
  location                     = each.value.location
  version                      = each.value.version
  administrator_login          = each.value.administrator_login
  administrator_login_password = each.value.administrator_login_password
  minimum_tls_version          = each.value.minimum_tls_version

  tags = var.tags

}

resource "azurerm_mssql_database" "mssqldb" {
  for_each       = var.sqlDatabase
  name           = each.key
  server_id      = azurerm_mssql_server.mssql[each.value.server_name].id
  collation      = each.value.collation
  license_type   = each.value.license_type
  max_size_gb    = each.value.max_size_gb
  read_scale     = each.value.read_scale
  sku_name       = each.value.sku_name
  zone_redundant = each.value.zone_redundant

  tags = var.tags

}

