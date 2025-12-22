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
    name                          = string #Name of the storage_account
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


variable "pips" {
  type = map(object({
    pip_name            = string
    resource_group_name = string
    location            = string
    allocation_method   = string

    tags = optional(map(string))
  }))
}

variable "nicks" {
  type = map(object({
    # NIC
    nic_name            = string
    location            = string
    resource_group_name = string

    # Public IP (data source)
    pip_name = string


    # Subnet / VNet (data source)
    subnet_name = string
    vnet_name   = string

  }))
}

variable "vms" {
  type = map(object({

    # VM basic details
    
    vm_name             = string
    resource_group_name = string
    location            = string
    size                = string

    # Admin credentials
    admin_username = string
    admin_password = optional(string) # password-based auth optional (SSH use ho sakta hai)

    # OS Disk
    os_disk = optional(object({
      caching              = string
      storage_account_type = string
    }))

    # Source Image
    source_image_reference = optional(object({
      publisher = string
      offer     = string
      sku       = string
      version   = string
    }))

  }))
}