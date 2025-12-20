rg_name = {
  rg1 = {
    name      = "rg_shiva1"    #name of resource group
    location  = "centralindia" #location where resource group will be created   
    tag = {
      env = "priprod"
      managed_by = "terraform"  #who will manage this(by terraform/portel)
    } #required tag
  }
}

stgs = {
  stgs1 = {
    name                     = "stgshiva1"
    resource_group_name      = "rg_shiva1"
    location                 = "centralindia"
    account_tier             = "Standard"
    account_replication_type = "GRS"
    public_network_access_enabled = true

    tags = {
      environment = "preprod"
      manage_by   = "terraform"
    }
  }
}

vnets = {
  vnet1 = {
    name                = "infra-vnet"
    location            = "centralindia"
    resource_group_name = "rg_shiva1"
    address_space       = ["10.0.0.0/16"]
    subnets = [
      {
        name             = "frontend-subnet"
        address_prefixes = ["10.0.1.0/24"] 
      },

      {
        name             = "bacend-subnet"
        address_prefixes = ["10.0.2.0/24"]
      }]
    }
  }
