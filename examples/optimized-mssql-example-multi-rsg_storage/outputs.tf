# Resource group output - using module output instead of direct resource reference
output "resource_group_name" {
  description = "The resource group name where the SQL Managed Instance is deployed"
  value       = module.optimized-mssql-managed-instance.resource_group_name
}


# Virtual network and subnet outputs using the declared data sources
output "virtual_network_id" {
  description = "The ID of the virtual network used by the SQL Managed Instance"
  value       = data.azurerm_virtual_network.vnet.id
}

output "subnet_id" {
  description = "The ID of the subnet used by the SQL Managed Instance"
  value       = data.azurerm_subnet.subnet.id
}

# Replace references to module attributes that don't exist with ones that do
output "managed_instance_id" {
  description = "The ID of the SQL Managed Instance"
  value       = module.optimized-mssql-managed-instance.managed_instance_id
}

# Replace vcore_count with the correct output attribute
output "vcores" {
  description = "The number of vCores of the SQL Managed Instance"
  value       = var.vcore_count  # Using the input variable as a fallback
}

# Replace mi_name with the correct output attribute
output "name" {
  description = "The name of the SQL Managed Instance"
  value       = var.mi_name  # Using the input variable as a fallback
}

# Add additional useful outputs
#output "managed_instance_fqdn" {
  #description = "The fully qualified domain name of the SQL Managed Instance"
 # value       = module.optimized-mssql-managed-instance.fqdn
#}

