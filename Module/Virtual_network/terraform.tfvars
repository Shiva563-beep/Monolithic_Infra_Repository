vnets = {
  vnet1 = {
    name                = "infra-vnet"
    location            = "centralindia"
    resource_group_name = "rg_shiva1"
    address_space       = ["10.0.0.0/16"]
    subnets = {
      subnet1 = {
        name             = "frontend-subnet"
        address_prefixes = ["10.0.1.0/24"]
      }
      subnet2 = {
        name             = "bacend-subnet"
        address_prefixes = ["10.0.2.0/24"]
      }
    }

  }
}
