variable "subscription_id" {
  description = "ID of the Azure subscription where Terraform should provision resource. Use azure cli command to query id: az account show --query id"
  type        = string
  default     = "7f3c4fcf-626c-49e0-9160-a756147abaa4"
}

variable "tenant_id" {
  description = "Azure AD tenant ID where needed by Terraform in order to authenticate with service principal. Use azure cli command to query id: az account show --query tenantId"
  type        = string
  default     = "fd6fb306-2acd-4fae-a721-c8f5714b622e"
}

variable "tags" {
  description = "Tags to be applied to the resources"
  type        = map(string)
  default     = {}
}

variable "location" {
  description = "Azure region where resources should be provisioned"
  type        = string
  default     = "westeurope"
}
variable "azure_resource_group" {
  description = "Name of the Azure resource group where resources will be provisioned"
  type        = string
  default     = "lvs-dev"
}
variable "acr_private_endpoint_vnet_name" {
  description = "Name of the virtual network where ACR private endpoint should be provisioned"
  type        = string
  default     = "lvs-dev-vnet"
}

variable "acr_private_endpoint_vnet_cidr" {
  description = "CIDR of the virtual network where ACR private endpoint should be provisioned"
  type        = string
  default     = "10.0.0.0/16"
}

variable "acr_private_endpoint_subnet_name" {
  description = "Name of the Azure subnet for ACR"
  type        = string
  default     = "lvs-dev-subnet"
}
variable "acr_private_endpoint_subnet_cidr" {
  description = "CIDR of the subnet where ACR private endpoint should be provisioned"
  type        = string
  default     = "10.0.1.0/24"
}

variable "acr_name" {
  description = "Name of the Azure Container Registry"
  type        = string
  default     = "lvsdevregistry"
}

variable "acr_sku" {
  description = "SKU of the Azure Container Registry"
  type        = string
  default     = "Premium"

  validation {
    condition     = contains(["Premium"], var.acr_sku)
    error_message = "Argument \"acr_sku\" must be either \"Premium\" in order to support private endpoints."
  }
}