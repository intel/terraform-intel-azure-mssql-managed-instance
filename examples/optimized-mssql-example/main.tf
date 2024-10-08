module "optimized-mssql-managed-instance" {
  mi_name                      = "terraformtestingexample"
  source                       = "intel/azure-mssql-managed-instance/intel"
  azurerm_resource_group_name  = "<ENTER_MI_RESOURCE_GROUP>"
  subnet_resource_group_name   = "<ENTER_MI_SUBNET_RESOURCE_GROUP>"
  azurerm_virtual_network_name = "<ENTER_VIRTUAL_NETWORK_NAME>"
  azurerm_subnet_name          = "<ENTER_SUBNET_NAME>"
  nsg_name                     = "<ENTER_NSG_NAME>"
  administrator_login_password = var.administrator_login_password
  administrator_login          = "sqladmin"
  license_type                 = "BasePrice"
  vcore_count                  = 8
  sku_name                     = "GP_Gen8IH"
  storage_size_in_gb           = 32
  tags = {
    owner    = "owner@company.com"
    duration = "4"
  }
}
