resource "azurerm_role_assignment" "tfsp" {
  scope                = "/subscriptions/1a412c86-c1c2-4696-8a2f-0859ec44b5c4"
  role_definition_name = "Key Vault Administrator"
  principal_id         = "44ab41cb-daa4-45f7-9f17-2c340d2c63d1"
}
