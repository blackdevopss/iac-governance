resource "azurerm_policy_definition" "policy" {
  name         = "accTestPolicy"
  policy_type  = "Custom"
  mode         = "Indexed"
  display_name = "Required Tags"

  policy_rule = <<POLICY_RULE
  {
 "if": {
        "allOf": [
          {
            "field": "type",
            "equals": "Microsoft.Resources/subscriptions/resourceGroups"
          },
          {
            "field": "[concat('tags[', parameters('tagName'), ']')]",
            "exists": "false"
          }
        ]
      },
      "then": {
        "effect": "[parameters('tagPolicyEffect')]"
      }
    }
  
POLICY_RULE


  parameters = <<PARAMETERS
    {
        "tagName": {
        "type": "String",
        "metadata": {
          "displayName": "Tag Required",
          "description": "Name of the tag, such as 'owner'"
        }
      },
              "tagPolicyEffect": {
 "type": "String",
                 "metadata": {
                 "displayName": "Effect",
                 "description": "Enable or disable the execution of the policy"
                 },
                 "allowedValues": [
                 "AuditIfNotExists",
                 "Disabled",
                 "Deny"
                 ],
                 "defaultValue": "AuditIfNotExists"
      }
  }
PARAMETERS

}