data "azurerm_resource_group" "rg" {
  name = "kinder-testing"
}

data "azurerm_resource_group" "rg2" {
  name = "testingkw"
}

data "azurerm_virtual_network" "vnet" {
  name                = "kinder-testing"
  resource_group_name = "kinder-testing"
}

data "azurerm_virtual_network" "vnet2" {
  name                = "testingkw"
  resource_group_name = "testingkw"
}
data "azurerm_subnet" "subnet" {
  name                 = "default"
  virtual_network_name = "kinder-testing"
  resource_group_name  = "kinder-testing"
}

data "azurerm_subnet" "subnet2" {
  name                 = "default"
  virtual_network_name = "testingkw"
  resource_group_name  = "testingkw"
}

data "azurerm_network_security_group" "nsg" {
  name                = "kinder-testing"
  resource_group_name = "kinder-testing"
}

data "azurerm_network_security_group" "nsg2" {
  name                = "testingkw"
  resource_group_name = "testingkw"
}
data "azurerm_route_table" "rt2" {
  name                = "testingkw"
  resource_group_name = "testingkw"
}

data "azurerm_route_table" "rt" {
  name                = "kinder-testing"
  resource_group_name = "kinder-testing"
}


resource "azurerm_mssql_managed_instance" "primary" {
  name                         = "mssqlserver-primary-ex"
  resource_group_name          = data.azurerm_resource_group.rg.name
  location                     = data.azurerm_resource_group.rg.location
  administrator_login          = "missadministrator"
  administrator_login_password = var.administrator_login_password
  vcores                       = 4
  storage_size_in_gb           = 32
  license_type                 = "BasePrice"
  subnet_id                    = data.azurerm_subnet.subnet.id
  sku_name                     = "GP_Gen5"
  tags = {
    owner    = "owner@company.com"
    duration = "4"
  }
}

resource "azurerm_mssql_managed_instance" "secondary" {
  name                         = "example-secondary"
  resource_group_name          = data.azurerm_resource_group.rg2.name
  location                     = "westus"
  administrator_login          = "missadministrator"
  administrator_login_password = var.administrator_login_password
  vcores                        = 4
  storage_size_in_gb           = 32
  license_type                 = "BasePrice"
  subnet_id                    = data.azurerm_subnet.subnet2.id
  sku_name                     = "GP_Gen5"

  tags = {
    owner    = "owner@company.com"
    duration = "4"
  }
}

resource "azurerm_mssql_managed_instance_failover_group" "example" {
  name                        = "example-failover-group"
  location                    = azurerm_mssql_managed_instance.primary.location
  managed_instance_id         = azurerm_mssql_managed_instance.primary.id
  partner_managed_instance_id = azurerm_mssql_managed_instance.secondary.id


  read_write_endpoint_failover_policy {
    mode          = "Automatic"
    grace_minutes = 60
  }
}