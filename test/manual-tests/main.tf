module "naming" {
  source  = "Azure/naming/azurerm"
  version = "0.4.1"
  prefix  = ["mod", "test"]
  #suffix = random_string.random.value

  unique-include-numbers = false
  unique-length          = 4
}
# Add bastion.

resource "azurerm_public_ip" "bastionpip" {
  name                = module.naming.public_ip.name_unique
  location            = data.azurerm_resource_group.this.location
  resource_group_name = data.azurerm_resource_group.this.name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_bastion_host" "bastion" {
  name                = module.naming.bastion_host.name_unique
  location            = data.azurerm_resource_group.this.location
  resource_group_name = data.azurerm_resource_group.this.name

  ip_configuration {
    name                 = "${module.naming.bastion_host.name_unique}-ipconf"
    subnet_id            = data.azurerm_subnet.this_bastion.id
    public_ip_address_id = azurerm_public_ip.bastionpip.id
  }
}

resource "azurerm_user_assigned_identity" "example_identity" {
  location            = data.azurerm_resource_group.this.location
  name                = module.naming.user_assigned_identity.name_unique
  resource_group_name = data.azurerm_resource_group.this.name
  tags                = var.tags
}

resource "random_password" "admin_password" {
  length           = 22
  min_lower        = 2
  min_numeric      = 2
  min_special      = 2
  min_upper        = 2
  override_special = "!#$%&()*+,-./:;<=>?@[]^_{|}~"
  special          = true
}

module "avm_res_keyvault_vault" {
  source                      = "Azure/avm-res-keyvault-vault/azurerm"
  version                     = "=0.7.1"
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  name                        = module.naming.key_vault.name_unique
  resource_group_name         = data.azurerm_resource_group.this.name
  location                    = data.azurerm_resource_group.this.location
  enabled_for_disk_encryption = true
  network_acls = {
    default_action = "Allow"
    bypass         = "AzureServices"
  }

  role_assignments = {
    deployment_user_secrets = { #give the deployment user access to secrets
      role_definition_id_or_name = "Key Vault Administrator"
      principal_id               = data.azurerm_client_config.current.object_id
    }
  }

  wait_for_rbac_before_key_operations = {
    create = "60s"
  }

  wait_for_rbac_before_secret_operations = {
    create = "60s"
  }

  tags = var.tags

  secrets = {
    admin_password = {
      name = "admin-password"
    }
  }

  secrets_value = {
    admin_password = random_password.admin_password.result
  }
}

module "testvm" {
  source  = "Azure/avm-res-compute-virtualmachine/azurerm"
  version = "0.15.1"

  admin_username                     = "azureuser"
  admin_password                     = random_password.admin_password.result
  disable_password_authentication    = false
  enable_telemetry                   = false
  encryption_at_host_enabled         = false
  generate_admin_password_or_ssh_key = false
  location                           = data.azurerm_resource_group.this.location
  name                               = module.naming.virtual_machine.name_unique
  resource_group_name                = data.azurerm_resource_group.this.name
  os_type                            = "Linux"
  sku_size                           = "Standard_D4_v5"
  zone                               = null

  custom_data = base64encode(data.local_file.cloudinit.content)

  network_interfaces = {
    network_interface_1 = {
      name = module.naming.network_interface.name_unique
      ip_configurations = {
        ip_configuration_1 = {
          name                          = "${module.naming.network_interface.name_unique}-ipconfig1"
          private_ip_subnet_resource_id = data.azurerm_subnet.this_acr.id
        }
      }
    }
  }

  os_disk = {
    caching              = "ReadWrite"
    storage_account_type = "StandardSSD_LRS"
  }

  source_image_reference = {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts-gen2"
    version   = "latest"
  }

  tags = var.tags

}