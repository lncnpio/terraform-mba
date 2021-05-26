terraform {
  required_version = "~>0.15.4"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>2.46.0"
    }
  }
}

provider "azurerm" {
  skip_provider_registration = true
  features {}
}

output "outPublicIp" {
  value = azurerm_public_ip.labPublicIp.ip_address
}

output "outFqdn" {
  value = azurerm_public_ip.labPublicIp.fqdn
}

output "outUser" {
  value = var.vmCredential.username
}

output "outPassword" {
  value = var.vmCredential.password
}
