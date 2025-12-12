stgs = {
  stgs1 = {
    name                     = "stgshiva1"
    resource_group_name      = "rg_shiva1"
    location                 = "centralindia"
    account_tier             = "Standard"
    account_replication_type = "GRS"

    tags = {
      environment = "preprod"
      manage_by = "terraform"
    }
  }
}
