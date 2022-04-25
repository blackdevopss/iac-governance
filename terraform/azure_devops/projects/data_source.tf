data "azurerm_resource_group" "azdo" {
  name = "rg-bdo-azdo"
}

output "rg_name" {
  value = data.azurerm_resource_group.azdo.name
}

data "azurerm_key_vault" "kv" {
  name                = "kv-azdo-core"
  resource_group_name = "rg-bdo-azdo"
}

output "vault_name" {
  value = data.azurerm_key_vault.kv.name
}