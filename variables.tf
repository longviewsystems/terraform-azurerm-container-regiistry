/********* GENERAL *********/
variable resource_group_name {
  type        = string
  description = "The name of the resource group in which to create the Azure Container Registry."
}

variable location {
  type        = string
  description = "The location where the resources will be created."
  default     = "East US"
}

variable tags {
  type        = map(string)
  description = "A map of tags to assign to the resources."
  default     = {}
}

/********* ACR *********/

variable acr_name {
  type        = string
  description = "The name of the Azure Container Registry."
}

variable sku {
  type        = string
  description = "The SKU of the Azure Container Registry (Basic, Standard, Premium)."
  default     = "Premium"
}

variable enable_quarantine_policy {
  description = "The container image quarantine feature in Azure Container Registry enables you to take control over the distribution of images by quarantining them until they’re verified."
  type        = bool
  default     = true
}

variable admin_enabled {
  description = "Enable admin access"
  type        = bool
  default     = true
}

variable retention_policy_enabled {
  type        = bool
  description = "Enable ACR retention policy"
  default     = true
}

/********* NETWORKING *********/
variable virtual_network_subnet_id {
  type        = string
  description = "The ID of the subnet within which the private endpoint will be created."
}

variable private_endpoint_enabled {
  description = "Enable private endpoint"
  type        = bool
  default     = true
}

variable public_network_access_enabled {
  description = "Enable public network access"
  type        = bool
  default     = true
}

variable retention_policy_in_days {
  type        = number
  description = "The retention policy for untagged images in the registry."
  default     = 7
}

variable private_dns_zone_id {
  description = "The ID of the private DNS zone"
  type        = string
  default     = ""
}
