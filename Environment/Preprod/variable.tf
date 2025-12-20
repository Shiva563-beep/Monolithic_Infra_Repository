variable "rg_name" {
  type = map(object(
    {
      name       = string                #name of resource group
      location   = string                #location where resource group will be created
      managed_by = optional(string)      #who will manage this(by terraform/portel)
      tag        = optional(map(string)) #required tag
    }
  ))

}

variable "stgs" {
  type = map(object({
    name                          = string
    resource_group_name           = string
    location                      = string
    account_tier                  = string
    account_replication_type      = string
    public_network_access_enabled = optional(bool)

    tags = optional(map(string))

  }))
}

variable "vnets" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    address_space       = list(string)
    tags                = optional(map(string))

    subnets = optional(list(object({
      name             = string
      address_prefixes = list(string)
    })))

  }))
}


