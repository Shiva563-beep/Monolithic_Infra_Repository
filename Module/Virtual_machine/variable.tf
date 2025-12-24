variable "vms" {
  description = "Map of Linux Virtual Machines configuration"
  type = map(object({

    # VM basic details

    vm_name             = string
    resource_group_name = string
    location            = string
    size                = string
    nic_name            = string


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


