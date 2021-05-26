resource "azurerm_resource_group" "Rgroup" {
  location = var.location
  name = "labRgroup"
}