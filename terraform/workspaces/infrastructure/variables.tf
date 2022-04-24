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

variable "tags" {
  type = map(string)
}

variable "client_id" {
  type = string
}

variable "client_secret" {
  type = string
}

variable "subscription_id" {
  type = string
}

variable "tenant_id" {
  type = string
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