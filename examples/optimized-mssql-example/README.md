<p align="center">
  <img src="https://github.com/intel/terraform-intel-azure-mssql-managed-instance/blob/main/images/logo-classicblue-800px.png?raw=true" alt="Intel Logo" width="250"/>
</p>


# Intel® Optimized Cloud Modules for Terraform

© Copyright 2024, Intel Corporation

## Azure MSSQL Intel Optimized Managed Instance 
The example deploys an Intel Optimized Azure MSSQL Managed Instance. Instance Selection and Intel Optimizations have been defaulted in the code.

The code selects premium Series - memory optimized Gen5 based on the Intel(R) Xeon Scalable 2.8 GHz processor (Ice Lake) processors.

This module uses a predefined resource group, virtual network, subnet, and network security group. 

<p align="center">
<img src="https://github.com/intel/terraform-intel-azure-mssql-managed-instance/blob/main/images/requirements.png?raw=true" alt="Important Notice" width="600">
</p>

## Important Notice


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

  variable "administrator_login_password" {
  description = "Password for the admin login user."
  type        = string
  sensitive   = true
}

# main.tf
module "optimized-mssql-managed-instance" {
  name                         = "terraformtestingexample"
  source                       = "intel/azure-mssql-managed-instance/intel"
  administrator_login_password = var.administrator_login_password
  resource_group_name          = "<ENTER_RESOURCE_GROUP_NAME>
  license_type                 = "BasePrice"
  sku_name                     = "GP_Gen5"
  storage_size_in_gb           = 32
  tags                         = {
    owner       = "owner@company.com"
    duration    = "4"
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




