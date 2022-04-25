resource "azuredevops_project" "azdo" {
  name               = "iac-governance"
  visibility         = "private"
  version_control    = "Git"
  work_item_template = "Agile"
  description        = "Terraform IAC Security and Governance"
}

resource "azuredevops_serviceendpoint_azurerm" "se" {
  project_id                = azuredevops_project.azdo.id
  service_endpoint_name     = "SVSConn-BlackDevOps"
  azurerm_spn_tenantid      = var.azurerm_spn_tenantid
  azurerm_subscription_id   = var.azurerm_subscription_id
  azurerm_subscription_name = var.azurerm_subscription_name
}

resource "azurerm_role_assignment" "bdo" {
  scope                = data.azurerm_key_vault.kv.id
  role_definition_name = "Key Vault Administrator"
  principal_id         = azuredevops_serviceendpoint_azurerm.se.id
}


resource "azuredevops_git_repository" "github" {
  project_id = azuredevops_project.azdo.id
  name       = "iac-governance"
  initialization {
    init_type   = "Import"
    source_type = "Git"
    source_url  = "https://github.com/blackdevopss/iac-governance.git"
  }
}

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

  depends_on = [
    azurerm_role_assignment.bdo, azuredevops_serviceendpoint_azurerm.se
  ]
}