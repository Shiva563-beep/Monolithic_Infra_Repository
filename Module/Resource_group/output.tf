output "id_rg" {
    value={
      for key, rg in azurerm_resource_group.rg_shiva:
      key=> rg.id
    }
}
