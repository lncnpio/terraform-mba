resource "azurerm_linux_virtual_machine" "labVmLinux" {
  name = "labVmLinux"
  computer_name = "LAB-Linux-Atividade-2"
  admin_username = var.vmCredential.username
  admin_password = var.vmCredential.password
  disable_password_authentication = false
  location = var.location
  resource_group_name = azurerm_resource_group.Rgroup.name
  size = "Standard_DS1_v2"
  network_interface_ids = [
    azurerm_network_interface.labNic.id
  ]

  os_disk {
    name = "labOSDisk"
    caching = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer = "UbuntuServer"
    sku = "18.04-LTS"
    version = "latest"
  }

  boot_diagnostics {
    storage_account_uri = azurerm_storage_account.labStorage.primary_blob_endpoint
  }

  depends_on = [azurerm_resource_group.Rgroup, azurerm_network_interface.labNic, azurerm_storage_account.labStorage]
}


