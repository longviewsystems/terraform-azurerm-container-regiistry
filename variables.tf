variable "resource_group_name" {
  type        = string
  description = "The name of the resource group in which to create the Azure Container Registry."
}

variable "location" {
  type        = string
  description = "The location where the resources will be created."
  default     = "East US"
}

variable "acr_name" {
  type        = string
  description = "The name of the Azure Container Registry."
}

variable "sku" {
  type        = string
  description = "The SKU of the Azure Container Registry (Basic, Standard, Premium)."
  default     = "Premium"
}

variable "virtual_network_subnet_id" {
  type        = string
  description = "The ID of the subnet within which the private endpoint will be created."
}

variable "public_network_access_enabled" {
  description = "Enable public network access"
  type        = bool
  default     = true
}

variable "admin_enabled" {
  description = "Enable admin access"
  type        = bool
  default     = true
}

variable "tags" {
  type        = map(string)
  description = "A map of tags to assign to the resources."
  default     = {}
}
