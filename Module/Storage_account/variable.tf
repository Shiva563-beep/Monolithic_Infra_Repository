variable "stgs" {
  type = map(object({
    name                     = string
    resource_group_name      = string
    location                 = string
    account_tier             = string
    account_replication_type = string
    public_network_access_enabled = optional(bool)

    tags = optional(map(string))

  }))

}
