location            = "centralus"
resource_group_name = "rg-bdoiac-demo"

// USER ASSIGNED MANAGED IDENTITIES
managed_identities = {

  "mi-bdoiac-demo" = {
    location            = "centralus"
    resource_group_name = "'rg-bdoiac-demo'"
  }
}

// APP SERVICES
app_service_plan = {

  "plan-bdoiac-demo" = {
    os_type      = "Windows"
    sku_name     = "S1"
    web_app_name = "app-bdoiac-demo"
  }
}

// DIAGNOSTICS LOGGING
diagnostic_logging = {

  "log_storage" = {
    azurerm_log_analytics_workspace_retention_in_days = 30
    log_analytics_workspace_name                      = "loga-bdoiac-demo"
    log_analytics_workspace_sku                       = "PerGB2018"
    storage_account_name                              = "stbdodiagnosticlogstore"
    storage_account_replication_type                  = "LRS"
    storage_account_tier                              = "Standard"
    application_insights_name                         = "appi-bdoiac-demo"
    application_insights_application_type             = "web"
  }
}

// SQL SERVER
sqlServers = {

  "sql-bdoiac-demo" = {
    administrator_login          = "devops"
    administrator_login_password = "exiWRZSlezoI3y4j"
    location                     = "centralus"
    version                      = "12.0"
    minimum_tls_version          = "1.2"
  }
}

// SQL DATABASE
sqlDatabase = {

  "sqldb-bdoiac-demo" = {
    collation      = "SQL_Latin1_General_CP1_CI_AS"
    license_type   = "LicenseIncluded"
    max_size_gb    = 2
    read_scale     = false
    sku_name       = "Basic"
    zone_redundant = false
    server_name    = "sql-bdoiac-demo"
  }
}

// KEY VAULT
key_vault = {

  "kv-bdoiac-demo" = {
    enable_rbac_authorization   = true
    enabled_for_deployment      = true
    enabled_for_disk_encryption = true
    location                    = "centralus"
    purge_protection_enabled    = false
    sku_name                    = "standard"
    soft_delete_retention_days  = 7
    tenant_id                   = "2a95a0cb-901a-49a7-83da-bc8e61c7f655"
  }
}

// PASSWORDS
passwords = {

  "sqlserver" = {
    length  = 16
    special = true
    upper   = true
    name    = "mssql-admin-password"
  }
}

// TAGS
tags = {

  "provisioner" = "terraform"
  "org"         = "blackdevops"
  "project"     = "IAC Scan"
}