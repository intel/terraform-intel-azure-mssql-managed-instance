data "azurerm_resource_group" "rg" {
  name = var.azurerm_resource_group_name
}

data "azurerm_virtual_network" "vnet" {
  name                = var.azurerm_virtual_network_name
  resource_group_name = var.azurerm_resource_group_name
}

data "azurerm_subnet" "subnet" {
  name                 = var.azurerm_subnet_name
  virtual_network_name = data.azurerm_virtual_network.vnet.name
  resource_group_name  = data.azurerm_resource_group.rg.name
}

data "azurerm_network_security_group" "nsg" {
  name                = var.nsg_name
  resource_group_name = data.azurerm_resource_group.rg.name
}

resource "azurerm_mssql_managed_instance" "mssql_managed_instance" {
  name                         = var.vm_name
  location                     = data.azurerm_resource_group.rg.location
  resource_group_name          = var.azurerm_resource_group_name
  administrator_login          = var.administrator_login
  administrator_login_password = var.administrator_login_password
  sku_name                     = var.sku_name
  storage_size_in_gb           = var.storage_size_in_gb
  vcores                       = var.vcore_count
  license_type                 = var.license_type
  subnet_id                    = data.azurerm_subnet.subnet.id
  tags                         = var.tags

  timeouts {
    create = "6h"
    delete = "1h"
  }

  # dynamic "azuread_administrator" {
  #   for_each = length(var.azuread_input_variables) == 0 ? toset([]) : var.azuread_input_variables
  #   content {
  #     login_username              = azuread_administrator.value["azuread_login_username"]
  #     object_id                   = azuread_administrator.value["azuread_object_id"]
  #     azuread_authentication_only = azuread_administrator.value["azuread_authentication_only"]
  #   }

  # }
}
