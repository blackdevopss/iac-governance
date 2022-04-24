terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.0.2"
    }
  }
}

provider "azurerm" {
  features {}
}

// Workspace configuration for state storage in terraform cloud
terraform {
  cloud {
    organization = "blackdevops"

    workspaces {
      name = "policy"
    }
  }
}