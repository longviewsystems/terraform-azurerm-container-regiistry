variable "virtual_network_details" {
  description = "The details of the virtual network."
  type = object({
    vnet_name                = string
    resource_group_name = string
  })
  default = {
    vnet_name                =  "mod-test-vnet-nnma"
    resource_group_name     = "mod-test-rg-nnma"
  }
}

variable "tags" {
  description = "A map of tags to add to the resources."
  type        = map(string)
  default     = {
    scenario = "testing terraform-azurerm-acr-module"
  }
}