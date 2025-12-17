resource "azurerm_virtual_network" "vnet" {
  for_each            = var.vnets
  name                = each.valu.name
  location            = each.valu.location
  resource_group_name = each.valu.resource_group_name
  address_space       = each.valu.address_space


  dynamic "subnet" {
    for_each = each.valu.subnets
    content {
      name             = subnet.valu.name
      address_prefixes = subnet.value.address_prefixes
    }
  }
}
