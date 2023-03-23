data "azurerm_resource_group" "rg" {
  name = var.azurerm_resource_group_name
}

data "azurerm_virtual_network" "vnet" {
  name                = var.azurerm_virtual_network_name
  resource_group_name = var.virtual_network_resource_group_name
}

data "azurerm_subnet" "example" {
  name                 = var.azurerm_subnet_name
  virtual_network_name = data.azurerm_virtual_network.vnet.name
  resource_group_name  = data.azurerm_resource_group.rg.name
}


resource "azurerm_sql_managed_instance" "example" {
  name                = var.vm_name
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = var.azurerm_resource_group_name
  administrator_login = var.administrator_login
  sku_name            = var.sku_name
  storage_size_gb     = var.storage_size_gb
  vcore_count         = var.vcore_count
  edition             = var.edition
  hardware_family     = var.hardware_family
  license_type        = var.license_type 
  subnet_id           = var.subnet_id
}


resource "azurerm_sql_database" "example" {
  name                             = "my-database"
  resource_group_name              = azurerm_resource_group.example.name
  location                         = azurerm_resource_group.example.location
  server_name                      = azurerm_sql_server.example.name
  edition                          = "Standard"
  collation                        = "SQL_Latin1_General_CP1_CI_AS"
  max_size_bytes                   = 2147483648
  requested_service_objective_name = "S0"

  tags                             = var.tags
}