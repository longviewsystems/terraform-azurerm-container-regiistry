# Output the resource group name
output "resource_group_name" {
  description = "The name of the resource group"
  value       = azurerm_resource_group.acr_resource_group.name
}
# Output the virtual network name
output "virtual_network_name" {
  description = "The name of the virtual network"
  value       = azurerm_virtual_network.acr_private_endpoint_vnet.name
}

# Output the subnet name
output "subnet_name" {
  description = "The name of the subnet for the ACR private endpoint"
  value       = azurerm_subnet.acr_private_endpoint_subnet.name
}

# Output the container registry name
output "acr_name" {
  description = "The name of the Azure Container Registry"
  value       = azurerm_container_registry.acr.name
}
# Output the private DNS zone name
output "acr_private_dns_zone_name" {
  description = "The name of the private DNS zone for the ACR"
  value       = azurerm_private_dns_zone.acr_private_dns_zone.name
}

# Output the private endpoint ID
output "acr_private_endpoint_id" {
  description = "The ID of the private endpoint for the Azure Container Registry"
  value       = azurerm_private_endpoint.acr_private_endpoint.id
}

# Output the private DNS zone virtual network link name
output "acr_private_dns_zone_virtual_network_link_name" {
  description = "The name of the private DNS zone virtual network link for the ACR private endpoint VNet"
  value       = azurerm_private_dns_zone_virtual_network_link.acr_private_dns_zone_virtual_network_link.name
}

output "acr_login_server" {
description = "The login server of the Azure Container Registry"
value = azurerm_container_registry.acr.login_server
}