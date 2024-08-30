
data "azurerm_client_config" "current" {}

#Update the variables (variables.tf) 
data azurerm_resource_group "this" {
  name = var.virtual_network_details.resource_group_name
}

data "azurerm_virtual_network" "this" {
  name                = var.virtual_network_details.vnet_name
  resource_group_name = var.virtual_network_details.resource_group_name
}

data "azurerm_subnet" "this_bastion" {
  name                 = "AzureBastionSubnet"
  virtual_network_name = var.virtual_network_details.vnet_name
  resource_group_name  = var.virtual_network_details.resource_group_name
}

data "azurerm_subnet" "this_acr" {
  name                 = "subnet-acr-test"
  virtual_network_name = var.virtual_network_details.vnet_name
  resource_group_name  = var.virtual_network_details.resource_group_name
}

