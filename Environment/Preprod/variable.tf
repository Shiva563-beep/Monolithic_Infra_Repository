variable "rg_name" {
  type = map(object(
    {
      name      = string                #name of resource group
      location  = string                #location where resource group will be created
      manged_by = optional(string)      #who will manage this(by terraform/portel)
      tag       = optional(map(string)) #required tag
    }
  ))

}

variable "stgs" {
  type = map(object({
    name                     = string
    resource_group_name      = string
    location                 = string
    account_tier             = string
    account_replication_type = string

    tags = optional(map(string))

  }))
}
