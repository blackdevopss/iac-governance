// POLICY ASSIGNMENT
resource "azurerm_subscription_policy_assignment" "assign_rg_required_tags" {
  for_each             = var.required_tags
  name                 = "Assign Required Tags ${each.value.tagName}"
  subscription_id      = "/subscriptions/1a412c86-c1c2-4696-8a2f-0859ec44b5c4"
  policy_definition_id = azurerm_policy_definition.policy.id
  description          = "Policy Assignment created for Required Tag ${each.value.tagName}"
  display_name         = "Required Tag ${each.value.tagName}"


  parameters = <<PARAMETERS
    {
      "tagName": {"value": "${each.value.tagName}" },
      "tagPolicyEffect": {"value": "${each.value.tagPolicyEffect}" }
    }
PARAMETERS
}


variable "required_tags" {
  type = map(object({
    tagName         = string
    tagPolicyEffect = string
  }))

  default = {
    "department" = {
      tagName         = "department"
      tagPolicyEffect = "Disabled"
    }
    "delete-by" = {
      tagName         = "delete-by"
      tagPolicyEffect = "Deny"
    }
  }

}

// POLICY DEFINITION
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