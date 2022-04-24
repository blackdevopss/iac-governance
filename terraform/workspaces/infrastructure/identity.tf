// USER ASSIGNED MANAGED IDENTITY
resource "azurerm_user_assigned_identity" "ua_mi" {
  for_each            = var.managed_identities
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  name                = each.key

  tags = var.tags
}


