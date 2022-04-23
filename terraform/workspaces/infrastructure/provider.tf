terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.0.2"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.1.2"
    }
  }
}

provider "azurerm" {
  client_id       = var.client_id
  client_secret   = var.client_secret
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id

  features {}
}

provider "random" {
  # Configuration options
}

// Workspace configuration for state storage in terraform cloud
terraform {
  cloud {
    organization = "blackdevops"

    workspaces {
      name = "infrastructure"
    }
  }
}



