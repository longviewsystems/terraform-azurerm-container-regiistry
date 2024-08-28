resource "azurerm_container_registry" "acr" {
  ##checkov:skip=CKV_AZURE_165:Georeplication is not required in this version.
  ##checkov:skip=CKV_AZURE_233:Zone Redundancy is not required in this version.
  ##checkov:skip=CKV_AZURE_164:Signing Policy is not required in this version.
  ##checkov:skip=CKV_AZURE_137:Admin Account defaults to false.
  ##checkov:skip=CKV_AZURE_237: Private endpoint is configured by this module.
  
  name                = var.acr_name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = var.sku
  
  quarantine_policy_enabled = var.enable_quarantine_policy
  
  #Depends on SKU type.  Must be Premium for this feature.
  retention_policy {  
    days = var.retention_policy_in_days
    enabled = var.retention_policy_enabled
  }
  
  admin_enabled                 = var.admin_enabled
  public_network_access_enabled = var.public_network_access_enabled

  tags                = var.tags

}

resource "azurerm_private_endpoint" "acr_private_endpoint" {
  name                = "${var.acr_name}-pe"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.virtual_network_subnet_id

  private_service_connection {
    name                           = "acrConnection"
    is_manual_connection           = false
    private_connection_resource_id = azurerm_container_registry.acr.id
    subresource_names              = ["registry"]
  }

  private_dns_zone_group {
    name                 = "default"
    private_dns_zone_ids = [var.private_dns_zone_id]
  }

  tags = var.tags
}
