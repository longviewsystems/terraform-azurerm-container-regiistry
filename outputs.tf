output "acr_id" {
  value       = azurerm_container_registry.acr.id
  description = "The ID of the Azure Container Registry."
}

output "acr_login_server" {
  value       = azurerm_container_registry.acr.login_server
  description = "The login server URL for the Azure Container Registry."
}

output "private_endpoint_id" {
  value       = azurerm_private_endpoint.acr_private_endpoint.id
  description = "The ID of the private endpoint."
}
