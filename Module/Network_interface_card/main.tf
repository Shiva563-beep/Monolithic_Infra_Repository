data "azurerm_public_ip" "pip" {
  for_each            = var.nicks
  name                = each.value.pip_name
  resource_group_name = each.value.resource_group_name
}


data "azurerm_subnet" "subnets" {
  for_each             = var.nicks
  name                 = each.value.subnet_name
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}



resource "azurerm_network_interface" "nick" {
  for_each            = var.nicks
  name                = each.value.nic_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.subnets[each.key].id
    public_ip_address_id          = data.azurerm_public_ip.pip[each.key].id
    private_ip_address_allocation = "Dynamic"
  }
}

