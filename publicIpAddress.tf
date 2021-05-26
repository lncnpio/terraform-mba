resource "azurerm_public_ip" "labPublicIp" {
  allocation_method = "Static"
  location = var.location
  name = "labPublicIp"
  resource_group_name = azurerm_resource_group.Rgroup.name
  domain_name_label = "data-query"

  depends_on = [azurerm_resource_group.Rgroup]
}