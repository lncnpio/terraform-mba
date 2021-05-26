variable "location" {
  default = "westeurope"
}

variable "vmCredential" {
  type = map
  default = {
    username = "userazure"
    password = "P@ssw0rdAzure"
  }
}
