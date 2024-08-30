variable "location" {
  description = "The location/region where the resources will be created."
  type        = string
  default = "eastus"
}

variable "tags" {
  description = "A map of tags to add to the resources."
  type        = map(string)
  default     = {
    scenario = "testing terraform-azurerm-acr-module"
  }
}