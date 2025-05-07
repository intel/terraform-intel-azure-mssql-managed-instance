<p align="center">
  <img src="https://github.com/intel/terraform-intel-azure-mssql-managed-instance/blob/main/images/logo-classicblue-800px.png?raw=true" alt="Intel Logo" width="250"/>
</p>


# Intel® Optimized Cloud Modules for Terraform

© Copyright 2025, Intel Corporation

## Azure MSSQL Intel Optimized Managed Instance 
The example deploys an Intel Optimized Azure MSSQL Managed Instance. Instance Selection and Intel Optimizations have been defaulted in the code.

The code selects premium Series - memory optimized Gen5 based on the Intel(R) Xeon Scalable 2.8 GHz processor (Ice Lake) processors.

This module uses a predefined resource group, virtual network, subnet, and network security group. 

This examples sets both MI Resource Group and MI Subnet Resource Group to be the same- see variables.tf

<p align="center">
<img src="https://github.com/intel/terraform-intel-azure-mssql-managed-instance/blob/main/images/requirements.png?raw=true" alt="Important Notice" width="600">
</p>

## Important Notice
<img src="https://github.com/intel/terraform-intel-azure-mssql-managed-instance/blob/main/images/important_notice_mssql_managed_instance.png?raw=true" alt="Important Notice" width="600"/>

## **Provisioning an Azure MSSQL Managed Instance can take up to 6 hours!**
More information can be found [Overview of Azure SQL Managed Instance management operations.](https://learn.microsoft.com/en-us/azure/azure-sql/managed-instance/management-operations-overview?view=azuresql)

## Usage
See examples folder for code ./examples/intel-optimized-azure-mssql-managed-server/main.tf

Example of main.tf

```hcl
# Example of how to pass variable for instance password:
# terraform apply -var="administrator_login_password=..."
# Environment variables can also be used https://www.terraform.io/language/values/variables#environment-variables

# Provision Intel Cloud Optimization Module

# variables.tf

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


# main.tf
module "optimized-mssql-managed-instance" {
  mi_name                      = var.mi_name
  source                       = "intel/azure-mssql-managed-instance/intel"
   
  azurerm_virtual_network_name         =  var.azurerm_virtual_network_name
  azurerm_resource_group_name          =  var.azurerm_resource_group_name
  azurerm_subnet_resource_group_name   =  var.azurerm_subnet_resource_group_name 
  azurerm_subnet_name                  =  var.azurerm_subnet_name
   
  administrator_login_password         = var.administrator_login_password
  administrator_login                  = "sqladmin"
  license_type                         = "BasePrice"
  vcore_count                          = 8
  sku_name                             = "GP_Gen8IH"
  storage_size_in_gb                   = 32
  
  tags = {
    owner    = "owner@company.com"
    duration = "4"
  }
}

```

Run Terraform

```hcl
terraform init  
terraform plan
terraform apply



```

Note that this example may create resources. Run `terraform destroy` when you don't need these resources anymore.

## Considerations  

More information about pricing and sku types can be found at: https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mssql_managed_instance.

It is important to choose the sku types and vcore options based off of the Terraform documentation and not the pricing calculator because those are the only options that the Azure provider supports.


It is important to either create or associate a predefined a route table to a SQL managed instance subnet that will be associated with the network security group. More details can be found here: https://learn.microsoft.com/en-us/azure/azure-sql/managed-instance/vnet-existing-add-subnet?view=azuresql




