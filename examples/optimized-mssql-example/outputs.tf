output "resource_group_name" {
  description = "Resource Group where the instance resides"
  value       = azurerm_mssql_managed_instance.managed_instance_example.resource_group_name
}

output "virtual_network_id" {
  description = "ID of the preconfigured virtual network"
  value       = data.azurerm_virtual_network.vnet.id
}

output "subnet_id" {
  description = "ID of the preconfigured subnet"
  value       = data.azurerm_subnet.subnet.id
}
output "sku_name" {
  description = "Instance SKU in use for the managed instance that was created"
  value       = module.optimized-mssql-managed-instance.sku_name
}

output "license_type" {
  description = "License type the managed instance is using"
  value       = module.optimized-mssql-managed-instance.license_type
}

output "vcores" {
  description = "Number of vcores on the managed instance "
  value       = module.optimized-mssql-managed-instance.vcore_count
}

output "name" {
  description = "The name of the mssql managed instance"
  value       = module.optimized-mssql-managed-instance.mi_name
}

output "storage_size_in_gb" {
  description = "Storage size of the managed instance in gigabytes "
  value       = module.optimized-mssql-managed-instance.storage_size_in_gb
}
