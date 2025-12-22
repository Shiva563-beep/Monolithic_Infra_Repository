data "azurerm_network_interface" "nic_data" {
    for_each=var.vms
  name                = each.value.nic_name
  resource_group_name = each.value.resource_group_name
}
resource "azurerm_linux_virtual_machine" "vm" {
    for_each= var.vms
    
  name                = each.value.vm_name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  size                = each.value.size
  admin_username      = each.value.admin_username
  
  admin_password = each.value.admin_password
  network_interface_ids = [
    module.nic.nick[each.value.nic_key].id,
  ]

  os_disk {
    caching              = each.value.caching
    storage_account_type = each.value.storage_account_type
  }

  source_image_reference {
    publisher = each.value.publisher
    offer     = each.value.offer
    sku       = each.value.sku
    version   = each.value.version
  }
}