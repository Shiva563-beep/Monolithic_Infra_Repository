module "rg_name" {
  source  = "../../Module/resource_group"
  rg_name = var.rg_name

}

module "stgs_name" {
  depends_on = [module.rg_name]

  source = "../../Module/Storage_account"
  stgs   = var.stgs

}

module "virtual_network" {
  depends_on = [module.rg_name]

  source = "../../Module/Virtual_network"
  vnets  = var.vnets

}
