terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
  use_oidc = true
}

terraform {
  backend "azurerm" {
    resource_group_name  = "tfstate-rg-team16"
    storage_account_name = "tfstate5ue8kcwm"
    container_name       = "tfstate"
    key                  = "prod.app.tfstate"
    use_oidc = true
  }
}
