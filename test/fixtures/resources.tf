# Create a Resource Group
resource "azurerm_resource_group" "test_rg" {
  name     = module.naming.resource_group.name_unique
  location = var.location
}

# Create a Virtual Network
resource "azurerm_virtual_network" "test_vnet" {
  name                = module.naming.virtual_network.name_unique
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.test_rg.location
  resource_group_name = azurerm_resource_group.test_rg.name
}

# Create a Subnet within the Virtual Network
resource "azurerm_subnet" "test_subnet" {
  name                 = "subnet-acr-test"
  resource_group_name  = azurerm_resource_group.test_rg.name
  virtual_network_name = azurerm_virtual_network.test_vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_subnet" "bastion_subnet" {
  name                 = "AzureBastionSubnet"
  resource_group_name  = azurerm_resource_group.test_rg.name
  virtual_network_name = azurerm_virtual_network.test_vnet.name
  address_prefixes     = ["10.0.2.0/24"]
}

# Create a Private DNS Zone for ACR
resource "azurerm_private_dns_zone" "acr_private_dns" {
  name                = "privatelink.azurecr.io"
  resource_group_name = azurerm_resource_group.test_rg.name
}

# Create a DNS Zone Virtual Network Link
resource "azurerm_private_dns_zone_virtual_network_link" "acr_dns_link" {
  name                  = "acr-dns-link"
  resource_group_name   = azurerm_resource_group.test_rg.name
  private_dns_zone_name = azurerm_private_dns_zone.acr_private_dns.name
  virtual_network_id    = azurerm_virtual_network.test_vnet.id
}

# Call the ACR Module
module "acr_test" {
  source              = "../../"  # Adjust the path as necessary
  resource_group_name = azurerm_resource_group.test_rg.name
  location            = azurerm_resource_group.test_rg.location
  acr_name            = module.naming.container_registry.name_unique
  public_network_access_enabled = false
  private_dns_zone_id = azurerm_private_dns_zone.acr_private_dns.id
  sku                 = "Premium"
  virtual_network_subnet_id = azurerm_subnet.test_subnet.id
  tags                = {
    Environment = "Test"
    Project     = "ACR Module Testing"
  }
}

