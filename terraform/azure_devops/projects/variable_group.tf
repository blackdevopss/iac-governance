resource "azuredevops_variable_group" "var_group" {
  project_id   = azuredevops_project.azdo.id
  name         = "Terraform-IAC-Vars"
  description  = "Variable Group for Terraform Deployments"
  allow_access = true

  key_vault {
    name                = data.azurerm_key_vault.kv.name
    service_endpoint_id = azuredevops_serviceendpoint_azurerm.se.id
  }

  variable {
    name = "client-id"
  }

  variable {
    name = "client-secret"
  }

  variable {
    name = "tenant-id"
  }

  variable {
    name = "subscription-id"
  }

  variable {
    name = "azdo-pat"
  }
}

