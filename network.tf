resource "azurerm_virtual_network" "labVnet" {
  address_space = ["172.16.0.0/16"]
  location = var.location
  name = "labVnet"
  resource_group_name = azurerm_resource_group.Rgroup.name

  depends_on = [azurerm_resource_group.Rgroup]
}

resource "azurerm_subnet" "labSubnet" {
  name = "labSubnet"
  resource_group_name = azurerm_resource_group.Rgroup.name
  virtual_network_name = azurerm_virtual_network.labVnet.name
  address_prefixes = ["172.16.20.0/24"]

  depends_on = [azurerm_resource_group.Rgroup, azurerm_virtual_network.labVnet]
}

resource "azurerm_network_interface" "labNic" {
  name = "labNic"
  location = var.location
  resource_group_name = azurerm_resource_group.Rgroup.name

  ip_configuration {
    name = "labNicConfiguration"
    private_ip_address_allocation = "Dynamic"
    subnet_id = azurerm_subnet.labSubnet.id
    public_ip_address_id = azurerm_public_ip.labPublicIp.id
  }

  depends_on = [azurerm_resource_group.Rgroup, azurerm_public_ip.labPublicIp, azurerm_subnet.labSubnet]
}

resource "azurerm_network_security_group" "labNetSec" {
  location = var.location
  name = "labNetSec"
  resource_group_name = azurerm_resource_group.Rgroup.name

  security_rule {
    name = "SSH"
    access = "Allow"
    direction = "Inbound"
    priority = 100
    protocol = "Tcp"
    destination_port_range = "22"
    source_port_range = "*"
    source_address_prefix = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name = "MySQL-Data"
    access = "Allow"
    direction = "Inbound"
    priority = 1001
    protocol = "Tcp"
    destination_port_range = "3306"
    source_port_range = "*"
    source_address_prefix = "*"
    destination_address_prefix = "*"
  }

  depends_on = [azurerm_resource_group.Rgroup]
}

resource "azurerm_network_interface_security_group_association" "labNicNetSecGrp" {
  network_interface_id = azurerm_network_interface.labNic.id
  network_security_group_id = azurerm_network_security_group.labNetSec.id

  depends_on = [azurerm_network_interface.labNic, azurerm_network_security_group.labNetSec]
}