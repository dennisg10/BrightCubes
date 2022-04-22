provider "azurerm" {
  features {}
}

terraform {
  required_providers {
    sops = {
      source  = "carlpett/sops"
      version = "~> 0.5"
    }
  }
}

provider "sops" {
}

terraform {
  backend "azurerm" {
    storage_account_name = "sadgterraform001sf"
    container_name       = "nwservices"
    key                  = "nw-services.terraform.tfstate"
    resource_group_name  = "rg-dgterraform"
    use_azuread_auth     = false
    subscription_id      = "274ed5a4-bc5f-4f7a-9b29-6bf02b73f2c8"

  }
}
