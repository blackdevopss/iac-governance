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

resource "azuredevops_git_repository" "github" {
  project_id = azuredevops_project.azdo.id
  name       = "iac-governance"
  initialization {
    init_type   = "Import"
    source_type = "Git"
    source_url  = "https://github.com/blackdevopss/iac-governance.git"
  }
}

