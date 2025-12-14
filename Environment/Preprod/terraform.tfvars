rg_name = {
  rg1 = {
    name      = "rg_shiva1"    #name of resource group
    location  = "centralindia" #location where resource group will be created
    manged_by = "terraform"    #who will manage this(by terraform/portel)
    tag = {
      env = "priprod"
      manage_by = "terraform"
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
    public_network_access_enabled = "true"

    tags = {
      environment = "preprod"
      manage_by   = "terraform"
    }
  }
}
