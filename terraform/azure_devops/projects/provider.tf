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
  # Configuration options
}

provider "azuread" {
  # Configuration options
}

provider "azurerm" {
  features {}
}