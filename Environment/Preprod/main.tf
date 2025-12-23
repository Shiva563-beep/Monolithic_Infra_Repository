  module "rg_name" {
    source  = "../../Module/resource_group"
    rg_name = var.rg_name

  }

  module "stgs_name" {
    depends_on = [module.rg_name]

    source = "../../Module/Storage_account"
    stgs   = var.stgs

  }

  module "vnet" {
    depends_on = [module.rg_name]
    
    source = "../../Module/Virtual_network"
    vnets = var.vnets
  }

  module "pip" {

    source = "../../Module/Public_ip"
    pips= var.pips
  }

  module "nic" {

    source="../../Module/Network_interface_card"
    nicks=var.nicks
  }
  
  module "vm" {
    depends_on = [module.rg_name, module.nic]

    source = "../../Module/Virtual_machine"
    vms= var.vms
    
  }