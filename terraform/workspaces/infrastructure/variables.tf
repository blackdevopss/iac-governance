variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "diagnostic_logging" {
  type = map(object({
    log_analytics_workspace_name                      = string
    log_analytics_workspace_sku                       = string
    azurerm_log_analytics_workspace_retention_in_days = number
    storage_account_name                              = string
    storage_account_tier                              = string
    storage_account_replication_type                  = string
  }))
}

variable "sqlServers" {
  type = map(object({
    version                      = string
    location                     = string
    administrator_login          = string
    administrator_login_password = string
    minimum_tls_version          = string
  }))

  default = {

  }
}

variable "sqlDatabase" {
  type = map(object({
    collation      = string
    license_type   = string
    max_size_gb    = number
    read_scale     = bool
    sku_name       = string
    zone_redundant = bool
    server_name    = string
  }))
}

variable "tags" {
  type = map(string)
}

variable "app_service_plan" {
  type = map(object({
    sku_name                              = string
    os_type                               = string
    web_app_name                          = string
    application_insights_name             = string
    application_insights_application_type = string

  }))
}

variable "managed_identities" {
  type = map(object({
    location            = string
    resource_group_name = string
  }))

}

variable "passwords" {
  type = map(object({
    length  = number
    special = bool
    upper   = bool
    name    = string
  }))
}

variable "key_vault" {
  type = map(object({
    enable_rbac_authorization   = bool
    enabled_for_deployment      = bool
    enabled_for_disk_encryption = bool
    purge_protection_enabled    = bool
    soft_delete_retention_days  = number
    tenant_id                   = string
    sku_name                    = string
    location                    = string
  }))
}