provider "azurerm" {
  features {
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }
  }
}

terraform {
  backend "local" {
    path = "./terraform.tfstate"
  }
}

terraform {
  required_providers {
    azuread = {
      source = "hashicorp/azuread"
      version = "3.1.0"
    }
    time = {
      source = "hashicorp/time"
      version = "0.12.1"
    }
    aap = {
      source = "ansible/aap"
      version = "1.0.0"
    }
  }
}

#https://registry.terraform.io/providers/ansible/aap/latest/docs/resources/group
#https://github.com/ansible/terraform-provider-ansible/blob/main/templates/resources/host.md.tmpl