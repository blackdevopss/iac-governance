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
  features {}

}

provider "random" {
  # Configuration options
}

terraform {
  cloud {
    organization = "blackdevops"

    workspaces {
      name = "infrastructure"
    }
  }
}



