## NOTE: Replace the default valuees below with your actual values or remove the defaults to make them required inputs ##
  #mi_name                              = "<ENTER_MANAGED_INSTANCE_NAME>" # Replace with actual MI name
  #vcore_count                          = 8 # Adjust as needed
  #azurerm_virtual_network_name         = "<ENTER VIRTUAL NETWORK>" # Replace with actual name of the resource group for where your virtual network is located
  #azurerm_resource_group_name          = "<ENTER RESOURCE GROUP NAME>" # Replace with actual subnet for SQL Managed Instance resource group name
  #azurerm_subnet_resource_group_name   = "<ENTER_MI_SUBNET_RESOURCE_GROUP>" # Replace with actual resource group name containing the SQL Managed Instance delegated subnet name, it can be same as your RSG for SQL Managed Instance
  #azurerm_subnet_name                  = "<ENTER_SUBNET_NAME>" # Replace with actual SQL Managed Instance delegated subnet name
  
variable "administrator_login_password" {
  description = "The password for the SQL Managed Instance administrator login"
  type        = string
  sensitive   = true
}
variable "mi_name" {
  description = "The name of the SQL Managed Instance"
  type        = string
  default     = "terraformtestingexample" # Replace with actual name of the SQL Managed Instance
}

variable "vcore_count" {
  description = "The number of vCores for the SQL Managed Instance"
  type        = number
  default     = 8 # Replace with actual vCore count as needed
}

variable "azurerm_virtual_network_name" {
  description = "Name of the virtual network where the SQL Managed Instance will be deployed"
  type        = string
  default     = "vnet1" # Replace with actual name of the resource group for where your virtual network is located
}

variable "azurerm_resource_group_name" {
  description = "Name of the main resource group for the SQL Managed Instance deployment"
  type        = string
  default     = "terraform-testing-rg" # Replace with actual subnet for SQL Managed Instance resource group name
}

variable "azurerm_subnet_resource_group_name" {
  description = "Name of the resource group containing the subnet for SQL Managed Instance"
  type        = string
  default     = "terraform-testing-rg" # Replace with actual resource group name containing the SQL Managed Instance delegated subnet name, it can be same as your RSG for SQL Managed Instance
}

variable "azurerm_subnet_name" {
  description = "Name of the subnet designated for SQL Managed Instance deployment"
  type        = string
  default     = "sqlsubnet" # Replace with actual SQL Managed Instance delegated subnet name
}

