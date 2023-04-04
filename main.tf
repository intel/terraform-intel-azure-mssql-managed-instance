data "azurerm_resource_group" "rg" {
  name = var.azurerm_resource_group_name
}

data "azurerm_virtual_network" "vnet" {
  name                = var.azurerm_virtual_network_name
  resource_group_name = var.azurerm_resource_group_name
}

data "azurerm_subnet" "example" {
  name                 = var.azurerm_subnet_name
  virtual_network_name = data.azurerm_virtual_network.vnet.name
  resource_group_name  = data.azurerm_resource_group.rg.name
}

data "azurerm_network_security_group" "example" {
  name                = var.nsg_name
  resource_group_name = data.azurerm_resource_group.rg.name
}

resource "azurerm_mssql_managed_instance" "example" {
  name                         = var.vm_name
  location                     = data.azurerm_resource_group.rg.location
  resource_group_name          = var.azurerm_resource_group_name
  administrator_login          = var.administrator_login
  administrator_login_password = var.administrator_login_password
  sku_name                     = var.sku_name
  storage_size_in_gb           = var.storage_size_gb
  vcores                       = var.vcore_count
  license_type                 = var.license_type
  subnet_id                    = data.azurerm_subnet.example.id
}


# resource "azurerm_sql_database" "example" {
#   name                             = "my-database"
#   resource_group_name              = azurerm_resource_group.example.name
#   location                         = data.azurerm_resource_group.rg.location
#   server_name                      = azurerm_sql_server.example.name
#   edition                          = "Standard"
#   collation                        = "SQL_Latin1_General_CP1_CI_AS"
#   max_size_bytes                   = 2147483648
#   requested_service_objective_name = "S0"

#   tags = var.tags
# }