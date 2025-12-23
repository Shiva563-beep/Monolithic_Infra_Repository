rg_name = {
  rg1 = {
    name     = "rg_shiva1"    #name of resource group
    location = "centralindia" #location where resource group will be created   
    tag = {
      env        = "priprod"
      managed_by = "terraform" #who will manage this(by terraform/portel)
    }                          #required tag
  }
}

stgs = {
  stgs1 = {
    name                          = "stgshiva1"
    resource_group_name           = "rg_shiva1"
    location                      = "centralindia"
    account_tier                  = "Standard"
    account_replication_type      = "GRS"
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
        name             = "backend-subnet"
        address_prefixes = ["10.0.2.0/24"]
    }]
  }
}

pips = {
  pip1 = {
    ip_name             = "frontend_pip"
    resource_group_name = "rg_shiva1"
    location            = "centralindia"
    allocation_method   = "Dynamic"

    tags = {
      env        = "priprod"
      managed_by = "terraform"
    }
  }
}

nicks = {
  nic1 = {
    nic_name            = "frontend_nic"
    location            = "centralindia"
    resource_group_name = "rg_shiva1"

    # Public IP (data source)
    pip_name = "frontend_pip"


    # Subnet / VNet (data source)
    subnet_name = "frontend-subnet"
    vnet_name   = "infra-vnet"



  }
}

vms = {
  vm1 = {
    
    vm_name              = "frontend_vm"
    resource_group_name  = "rg_shiva1"
    location             = "centralindia"
    size                 = "Standard_D2s_v3"

    
    admin_username       = "Aaaaaa12345"
    admin_password       = "Aaaaaa@12345"
    
    os_disk = {
      caching              = "ReadWrite"
      storage_account_type = "Standard_LRS"
    }

    source_image_reference = {
      publisher = "Canonical"
      offer     = "0001-com-ubuntu-server-jammy"
      sku       = "22_04-lts"
      version   = "latest"
    }


  }
}
