module "optimized-mssql-managed-instance" {
  mi_name                      = "terraformtstexample1"
  source                       = "intel/azure-mssql-managed-instance/intel"
  azurerm_subnet_name          = "<ENTER_SUBNET_NAME>" # Replace with actual subnet name
  nsg_name                     = "<ENTER_NETWORK_SECURITY_GROUP_NAME>" # Replace with actual NSG name
  azurerm_virtual_network_name = "<ENTER VIRTUAL NETWORK>" # Replace with actual VNet name
  azurerm_resource_group_name  = "<ENTER RESOURCE GROUP NAME>" # Replace with actual RG name
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