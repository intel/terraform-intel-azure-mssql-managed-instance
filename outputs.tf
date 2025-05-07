output "resource_group_name" {
  description = "The resource group where the instance resides"
  value       = data.azurerm_resource_group.rg.id
}

output "virtual_network_id" {
  description = "The ID of the preconfigured virtual network"
  value       = data.azurerm_virtual_network.vnet.id
}

#output "network_security_group_id" {
#  description = "The ID of the preconfigured virtual network"
#  value       = data.azurerm_network_security_group.nsg.id
#}

output "subnet_id" {
  description = "The ID of the preconfigured subnet"
  value       = data.azurerm_subnet.subnet.id
}

output "vm_name" {
  description = "The name of the instance being created"
  value       = azurerm_mssql_managed_instance.mssql_managed_instance.name
}

output "sku_name" {
  description = "Instance SKU in use for the managed instance that was created"
  value       = azurerm_mssql_managed_instance.mssql_managed_instance.sku_name
}

output "license_type" {
  description = "The type of license the instance used"
  value       = azurerm_mssql_managed_instance.mssql_managed_instance.license_type
}

output "vcores" {
  description = "Number of vcores on the managed instance"
  value       = azurerm_mssql_managed_instance.mssql_managed_instance.vcores
}

output "administrator_login" {
  description = "MSSQL managed instance administrator username"
  value       = azurerm_mssql_managed_instance.mssql_managed_instance.administrator_login
}

output "location" {
  description = "Location where the virtual machine will be created"
  value       = azurerm_mssql_managed_instance.mssql_managed_instance.location
}

output "managed_instance_id" {
  description = "The ID of the managed instance"
  value       = azurerm_mssql_managed_instance.mssql_managed_instance.id
}

output "storage_size_in_gb" {
  description = "The number of GBs associated with the instance"
  value       = azurerm_mssql_managed_instance.mssql_managed_instance.storage_size_in_gb
}
output "timeouts" {
  description = "The timeout constraints associated with the instance if configured"
  value       = azurerm_mssql_managed_instance.mssql_managed_instance.timeouts
}
output "tags" {
  description = "The tags associated with the instance"
  value       = azurerm_mssql_managed_instance.mssql_managed_instance.tags
}


