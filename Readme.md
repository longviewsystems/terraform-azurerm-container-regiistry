## Overview
This Terraform module provisions an Azure Container Registry (ACR) with private endpoints and a private DNS zone. It sets up the necessary Azure infrastructure components, including a resource group, virtual network, subnet, and the ACR itself with secure internal access.



Functionality Supported:
- Create a ACR with Private endpoints
- Test with Terratest
- Generate README.md pdf

Note: 

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

<!-- BEGIN_TF_DOCS -->





## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 2.9.0 |

## Resources

| Name | Type |
|------|------|
| [azurerm_resource_group.acr_resource_group](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_container_registry.acr](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/container_registry) | resource |
| [azurerm_virtual_network.acr](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network) | resource |
| [azurerm_subnet.acr_private_endpoint_subnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_private_dns_zone.acr_private_dns_zone](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/private_dns_zone) | resource |
| [azurerm_private_endpoint.acr_private_endpoint](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_endpoint) | resource |

## Modules

No modules.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_acr__name"></a> [acr_name](#input\_acr\_name) | Name of the Azure Container Registry | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Location used to deploy the resources | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Resource group name | `string` | n/a | yes |
| <a name="input_acr_private_endpoint_vnet_name"></a> [acr_private_endpoint_vnet_name](#input\acr_private_endpoint_vnet_name) | Name of the virtual network where ACR private endpoint should be provisioned | `string` | n/a| yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to be assigned to the resources | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="acr_private_endpoint"></a> [acr_private_endpoint](#output\_endpoint) | ACR with private endpoint |

<!-- END_TF_DOCS -->    

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->