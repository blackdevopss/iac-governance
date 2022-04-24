location            = "centralus"
resource_group_name = "rg-bdoiaciac-demo"

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
    max_size_gb    = 5
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