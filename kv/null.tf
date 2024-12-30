# resource "null_resource" "check_object_id_in_kv" {
#   triggers = {
#     key_vault_name = local.key_vault_name
#     object_id      = data.azurerm_client_config.current.object_id
#   }

#   provisioner "local-exec" {
#     command = <<EOT
#       #!/bin/bash
#       KEYVAULT_NAME="${local.key_vault_name}"
#       RESOURCE_GROUP="${var.rg_name}"
#       OBJECT_ID="${data.azurerm_client_config.current.object_id}"

#       # Check if the current object ID exists in the access policies
#       POLICY_EXISTS=$(az keyvault show --name "$KEYVAULT_NAME" --resource-group "$RESOURCE_GROUP" \
#         --query "properties.accessPolicies[?objectId=='$OBJECT_ID']" -o tsv)

#       if [ -z "$POLICY_EXISTS" ]; then
#           echo "false" > object_id_exists.txt
#       else
#           echo "true" > object_id_exists.txt
#       fi
#     EOT
#     interpreter = ["/bin/bash", "-c"]
#   }
# }

# resource "local_file" "object_id_status" {
#   content  = file("${path.module}/object_id_exists.txt")
#   filename = "${path.module}/object_id_exists.txt"
# }

# locals {
#   file_exists = fileexists("${path.module}/object_id_exists.txt")
#   file_content = local.file_exists ? file("${path.module}/object_id_exists.txt") : "false"
#   object_id_exists = trim(local.file_content, "\n") == "true"
# }



