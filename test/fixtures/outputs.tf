# outputs.tf

output "acr_id" {
  value = module.acr_test.acr_id
}

output "acr_login_server" {
  value = module.acr_test.acr_login_server
}

output "private_endpoint_id" {
  value = module.acr_test.private_endpoint_id
}

output "dns_zone_name" {
  value       = azurerm_private_dns_zone.acr_private_dns.name
  description = "The name of the private DNS zone."
}