terraform {
  backend "azurerm" {
    resource_group_name  = "shiva-rg"
    storage_account_name = "shivastg47118"
    container_name       = "file"
    key                  = "terraform.tfstate"
  }
}
