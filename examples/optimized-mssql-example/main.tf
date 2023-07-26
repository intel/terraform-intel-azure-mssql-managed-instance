data "azurerm_resource_group" "rg" {
  name = "<ENTER_RESOURCE_GROUP_NAME>"
}

data "azurerm_virtual_network" "vnet" {
  name                = "<ENTER_VIRTUAL_NETWORK_NAME>"
  resource_group_name = "<ENTER_RESOURCE_GROUP_NAME>"
}
data "azurerm_subnet" "subnet" {
  name                 = "default"
  virtual_network_name = "<ENTER_VIRTUAL_NETWORK_NAME>"
  resource_group_name  = "<ENTER_RESOURCE_GROUP_NAME>"
  #enforce_private_link_endpoint_network_policies = true
}

module "optimized-mssql-managed-instance" {
  mi_name                      = "terraformtestingexample"
  source                       = "../../"
  azurerm_subnet_name          = "<ENTER_SUBNET_NAME>"
  nsg_name                     = "<ENTER_NETWORK_SECURITY_GROUP_NAME>"
  azurerm_virtual_network_name = "<ENTER_VIRTUAL_NETWORK_NAME>"
  administrator_login_password = var.administrator_login_password
  administrator_login          = "sqladmin"
  license_type                 = "BasePrice"
  vcore_count                  = 4
  sku_name                     = "GP_Gen8IH"
  storage_size_in_gb           = 32
  tags = {
    owner    = "owner@company.com"
    duration = "4"
  }
}
