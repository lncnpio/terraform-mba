resource "azurerm_storage_account" "labStorage" {
  name = "diag${random_id.idRandom.hex}"
  account_replication_type = "LRS"
  account_tier = "Standard"
  location = var.location
  resource_group_name = azurerm_resource_group.Rgroup.name

  depends_on = [azurerm_resource_group.Rgroup, random_id.idRandom]
}

resource "random_id" "idRandom" {
  keepers = {
    resource_group = azurerm_resource_group.Rgroup.name
  }
  byte_length = 8

  depends_on = [azurerm_resource_group.Rgroup]
}