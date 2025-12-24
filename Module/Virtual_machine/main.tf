data "azurerm_network_interface" "nic_data" {
  for_each            = var.vms
  name                = each.value.nic_name
  resource_group_name = each.value.resource_group_name
}

resource "azurerm_linux_virtual_machine" "vm" {
  for_each = var.vms

  name                = each.value.vm_name
  computer_name       = replace(each.value.vm_name, "_", "-")
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  size                = each.value.size
  admin_username      = each.value.admin_username


  admin_password = each.value.admin_password
  disable_password_authentication = false

  network_interface_ids = [
    data.azurerm_network_interface.nic_data[each.key].id,
  ]

  os_disk {
    caching              = lookup(each.value.os_disk, "caching", null)
    storage_account_type = lookup(each.value.os_disk, "storage_account_type", null)
  }

  source_image_reference {
    publisher = lookup(each.value.source_image_reference, "publisher", null)
    offer     = lookup(each.value.source_image_reference, "offer", null)
    sku       = lookup(each.value.source_image_reference, "sku", null)
    version   = lookup(each.value.source_image_reference, "version", null)
  }
}


