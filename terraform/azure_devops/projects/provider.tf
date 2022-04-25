terraform {
  required_providers {
    azuredevops = {
      source  = "microsoft/azuredevops"
      version = "0.2.1"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.0.2"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "2.21.0"
    }
  }
}

provider "azuredevops" {
  org_service_url       = var.azuredevops_org_url
  personal_access_token = var.azuredevops_personal_access_token

}

provider "azuread" {
  client_id       = var.azurerm_spn_client_id
  client_secret   = var.azurerm_spn_secret
  tenant_id       = var.azurerm_spn_tenantid
  subscription_id = var.azurerm_subscription_id

}

provider "azurerm" {
  features {}
  client_id       = var.azurerm_spn_client_id
  client_secret   = var.azurerm_spn_secret
  tenant_id       = var.azurerm_spn_tenantid
  subscription_id = var.azurerm_subscription_id
}

terraform {
  cloud {
    organization = "blackdevops"

    workspaces {
      name = "azure-devops"
    }
  }
}

