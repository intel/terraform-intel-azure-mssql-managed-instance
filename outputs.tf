########################
####     General    ####
########################

# output "sku_name" {
#     description = "Instance SKU in use for the managed instance that was created"
#     value = azurerm_mssql_managed_instance.mssql_managed_instance.sku_name
# }

# output "name" {
#     description = "The name of the instance"
#     value = azurerm_mssql_managed_instance.mssql_managed_instance.name
# }

# output "resource_group_name" {
#     description = "Resource Group where the instance resides"
#     value = azurerm_mssql_managed_instance.mssql_managed_instance.resource_group_name
# }

# output "location" {
#     description = "The location where the instance resides"
#     value = azurerm_mssql_managed_instance.mssql_managed_instance.location
# }


# output "license_type" {
#     description = "The type of license the instance used"
#     value = azurerm_mssql_managed_instance.mssql_managed_instance.license_type
# }

# output "subnet_id" {
#     description = "The id of the subnet associated with the instance"
#     value = azurerm_mssql_managed_instance.mssql_managed_instance.name
# }

# output "tags" {
#     description = "The tags associated with the instance"
#     value = azurerm_mssql_managed_instance.mssql_managed_instance.tags
# }



########################
#### Authentication ####
########################
# output "administrator_login" {
#     description = "The master username of the instance"
#     value = azurerm_mssql_managed_instance.mssql_managed_instance.administrator_login
# }
# output "administrator_login_password" {
#   description = "The master password of the instance"
#   value       = azurerm_mssql_managed_instance.administrator_login_password
#   sensitive   = true
# }
###########################
#### High Availablilty ####
###########################

########################
####    Storage     ####
########################

# output "storage_size_in_gb" {
#     description = "The number of GBs associated with the instance"
#     value = azurerm_mssql_managed_instance.storage_size_in_gb
# }

########################
####    Firewall    ####
########################

########################
####    Database    ####
########################

########################
####     Restore    ####
########################


