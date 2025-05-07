data "azurerm_virtual_network" "vnet" {
  name                = var.azurerm_virtual_network_name
  resource_group_name = var.azurerm_subnet_resource_group_name
}

data "azurerm_subnet" "subnet" {
  name                 = var.azurerm_subnet_name
  virtual_network_name = data.azurerm_virtual_network.vnet.name
  resource_group_name  = var.azurerm_subnet_resource_group_name
}

## NOTE: For the module below, please see ther variables.tf file for the required variables ##
module "optimized-mssql-managed-instance" {
  mi_name                      = var.mi_name
  #source                       = "intel/azure-mssql-managed-instance/intel"
  source                       = "../.." # Use local path for testing purposes
 
  azurerm_virtual_network_name         =  var.azurerm_virtual_network_name
  azurerm_resource_group_name          =  var.azurerm_resource_group_name
  azurerm_subnet_resource_group_name   =  var.azurerm_subnet_resource_group_name 
  azurerm_subnet_name                  =  var.azurerm_subnet_name
   
  administrator_login_password         = var.administrator_login_password
  administrator_login                  = "sqladmin"
  license_type                         = "BasePrice"
  vcore_count                          = 8
  sku_name                             = "GP_Gen8IH"
  storage_size_in_gb                   = 32
  
  tags = {
    owner    = "owner@company.com"
    duration = "4"
  }
}