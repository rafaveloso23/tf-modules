#!/bin/bash

# Variables
KEYVAULT_NAME="kvrvstfsd"

# Get the current Azure CLI user's object ID
OBJECT_ID=$(az ad signed-in-user show --query objectId -o tsv 2>/dev/null || az ad sp show --id $(az account show --query user.name -o tsv) --query objectId -o tsv)

# Validate if OBJECT_ID was retrieved
if [ -z "$OBJECT_ID" ]; then
    echo "Error: Unable to retrieve the current execution object ID."
    exit 1
fi

# Fetch Key Vault Access Policies
ACCESS_POLICIES=$(az keyvault show --name "$KEYVAULT_NAME" --query properties.accessPolicies -o json)

# Validate if the OBJECT_ID exists in the Access Policies
if echo "$ACCESS_POLICIES" | jq -e '.[] | select(.objectId=="'"$OBJECT_ID"'")' > /dev/null; then
    echo "true"
else
    echo "false"
fi
