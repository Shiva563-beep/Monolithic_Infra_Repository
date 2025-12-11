terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.55.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "shiva-rg"
    storage_account_name = "shivastg7118"
    container_name       = "file"
    key                  = "terraformtfstate"
  }
}

provider "azurerm" {
  features {}
  subscription_id = "0fed9206-7606-41d6-bea8-83033d2b432f"
}