variable "nicks" {
    type=map(object({
         # NIC
    nic_name    = string
    location    = string
    resource_group_name = string

    # Public IP (data source)
    pip_name    = string
    

    # Subnet / VNet (data source)
    subnet_name     = string
    virtual_network_name      = string
    
    }))
}