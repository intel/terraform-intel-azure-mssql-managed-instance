<p align="center">
  <img src="./images/logo-classicblue-800px.png" alt="Intel Logo" width="250"/>
</p>

# Intel® Cloud Optimization Modules for Terraform

© Copyright 2022, Intel Corporation

## Azure MSSQL Managed Instance Module
The example creates an Intel Optimized Azure MSSQL Managed Instance. Instance Selection and Intel Optimizations have been defaulted in the code. This instance is created on Intel's Xeon Scalable 2.8 GHz processor (Ice Lake) Premium Series Gen5 processor. 

The instance is pre-configured with parameters within the database parameter group that is optimized for Intel architecture. The goal of this module is to get you started with an instance configured to run best on Intel architecture.

This module uses a predefined resource group, virtual network, subnet, and network security group. 

## Important Notice
<img src="./images\important_notice_mssql_managed_instance.png?raw=true" alt="Important Notice" width="600"/>

## **Provisioning an Azure MSSQL Managed Instance can take up to 6 hours!**
More information can be found [Overview of Azure SQL Managed Instance management operations.](https://learn.microsoft.com/en-us/azure/azure-sql/managed-instance/management-operations-overview?view=azuresql)

## Usage
See examples folder for code ./examples/intel-optimized-azure-mssql-managed-server/main.tf

Example of main.tf

```hcl
# Example of how to pass variable for instance password:
# terraform apply -var="administrator_login_password=..."
# Environment variables can also be used https://www.terraform.io/language/values/variables#environment-variables
```

# Provision Intel Cloud Optimization Module

variables.tf
```hcl
  variable "administrator_login_password" {
  description = "Password for the admin login user."
  type        = string
  sensitive   = true
}
```

main.tf
```hcl
module "optimized-mssql-managed-instance" {
  name                         = "terraformtestingexample"
  source                       = "../../"
  administrator_login_password = var.administrator_login_password
  resource_group_name          = "kinder-testing"
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




