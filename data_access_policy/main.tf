provider "null" {}
data "azurerm_client_config" "current" {}

resource "null_resource" "validate_key_vault_object_id" {
  provisioner "local-exec" {
    command = <<EOT
      ACCESS_POLICIES=$(az keyvault show --name "${self.triggers.kv_name}" --query properties.accessPolicies -o json)
      if echo "$ACCESS_POLICIES" | jq -e '.[] | select(.objectId=="${self.triggers.object_id}")' > /dev/null; then
        echo "true"
      else
        echo "false"
      fi
    EOT
    interpreter = ["/bin/bash", "-c"]
  }

  triggers = {
    object_id = data.azurerm_client_config.current.object_id
    kv_name   = "kvrvstfsd"
    result    = chomp(trimsuffix(trimspace(shell("az keyvault show --name ${self.triggers.kv_name} --query properties.accessPolicies -o json | jq -e '.[] | select(.objectId==\"${self.triggers.object_id}\")' && echo true || echo false")), "\n"))
  }
}

output "key_vault_object_id_exists" {
  value = null_resource.validate_key_vault_object_id.triggers.result
}






