resource "time_sleep" "waitForVm" {
  create_duration = "90s"
  depends_on = [azurerm_linux_virtual_machine.labVmLinux]
}

resource "null_resource" "uploadFiles" {
  provisioner "file" {
    connection {
      type = "ssh"
      host = azurerm_public_ip.labPublicIp.ip_address
      user = var.vmCredential.username
      password = var.vmCredential.password
    }

    source = "configFiles"
    destination = "/home/userazure"
  }

  depends_on = [time_sleep.waitForVm]
}

resource "null_resource" "install-dbServer" {
  triggers = {
    order = null_resource.uploadFiles.id
  }

  provisioner "remote-exec" {
    connection {
      type = "ssh"
      host = azurerm_public_ip.labPublicIp.ip_address
      user = var.vmCredential.username
      password = var.vmCredential.password
    }

    script = "./configdb.sh"
  }
}