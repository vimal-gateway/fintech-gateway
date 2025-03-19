provider "azurerm" {
  features {}
}

terraform {
  required_version = ">= 1.4.0"
  backend "azurerm" {
    resource_group_name  = "fintech-rg"
    storage_account_name = "fintech-background-storage"
    container_name       = "state"
    key                  = "terraform.tfstate"
  }
}
