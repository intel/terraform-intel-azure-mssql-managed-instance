module "optimized-mssql-managed-instance" {
  vm_name                      = "terraformtestingexample"
  source                       = "../../"
  administrator_login_password = var.administrator_login_password
  administrator_login          = "sqladmin"
  azurerm_resource_group_name  = "kinder-testing"
  license_type                 = "BasePrice"
  vcore_count                  = 4
  sku_name                     = "GP_Gen5"
  storage_size_in_gb           = 32
  tags = {
    owner    = "owner@company.com"
    duration = "4"
  }
}
