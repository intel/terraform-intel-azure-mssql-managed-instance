module "optimized-mssql-managed-instance" {
  name                         = "terraformtestingexample"
  source                       = "../../"
  administrator_login_password = var.administrator_login_password
  resource_group_name          = "kinder-testing"
  license_type                 = "BasePrice"
  vcores                       = 4
  sku_name                     = "GP_Gen5"
  storage_size_in_gb           = 32
  tags = {
    owner    = "owner@company.com"
    duration = "4"
  }
}

resource "azurerm_resource_group" "example" {
  name     = "rg-example"
  location = "West Europe"
}

resource "azurerm_sql_managed_instance" "primary" {
  name                         = "example-primary"
  resource_group_name          = azurerm_resource_group.primary.name
  location                     = azurerm_resource_group.primary.location
  administrator_login          = "mradministrator"
  administrator_login_password = "thisIsDog11"
  license_type                 = "BasePrice"
  subnet_id                    = azurerm_subnet.primary.id
  sku_name                     = "GP_Gen5"
  vcores                       = 4
  storage_size_in_gb           = 32

  depends_on = [
    azurerm_subnet_network_security_group_association.primary,
    azurerm_subnet_route_table_association.primary,
  ]

  tags = {
    environment = "prod"
  }
}

resource "azurerm_sql_managed_instance" "secondary" {
  name                         = "example-secondary"
  resource_group_name          = azurerm_resource_group.secondary.name
  location                     = azurerm_resource_group.secondary.location
  administrator_login          = "mradministrator"
  administrator_login_password = "thisIsDog11"
  license_type                 = "BasePrice"
  subnet_id                    = azurerm_subnet.secondary.id
  sku_name                     = "GP_Gen5"
  vcores                       = 4
  storage_size_in_gb           = 32

  depends_on = [
    azurerm_subnet_network_security_group_association.secondary,
    azurerm_subnet_route_table_association.secondary,
  ]

  tags = {
    environment = "prod"
  }
}

resource "azurerm_sql_managed_instance_failover_group" "example" {
  name                        = "example-failover-group"
  resource_group_name         = azurerm_resource_group.primary.name
  location                    = azurerm_sql_managed_instance.primary.location
  managed_instance_name       = azurerm_sql_managed_instance.primary.name
  partner_managed_instance_id = azurerm_sql_managed_instance.secondary.id

  read_write_endpoint_failover_policy {
    mode          = "Automatic"
    grace_minutes = 60
  }
}