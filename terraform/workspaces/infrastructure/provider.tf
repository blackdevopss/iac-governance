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
  client_id       = "44ab41cb-daa4-45f7-9f17-2c340d2c63d1"
  client_secret   = "R-~8Q~pa4~f0w23CemQxYCgd1qP~AJatqsM1Nc3X"
  subscription_id = "1a412c86-c1c2-4696-8a2f-0859ec44b5c4"
  tenant_id       = "2a95a0cb-901a-49a7-83da-bc8e61c7f655"
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



