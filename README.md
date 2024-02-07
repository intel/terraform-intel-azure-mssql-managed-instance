<p align="center">
  <img src="https://github.com/intel/terraform-intel-azure-mssql-managed-instance/blob/main/images/logo-classicblue-800px.png?raw=true" alt="Intel Logo" width="250"/>
</p>

# Intel® Optimized Cloud Modules for Terraform

© Copyright 2024, Intel Corporation

## Azure MSSQL Managed Instance Module
The example creates an Intel Optimized Azure MSSQL Managed Instance. Instance Selection and Intel Optimizations have been defaulted in the code. This instance is created on Intel's Xeon Scalable 2.8 GHz processor (Ice Lake) Premium Series Gen5 processor. 

The instance is pre-configured with parameters within the database parameter group that is optimized for Intel architecture. The goal of this module is to get you started with an instance configured to run best on Intel architecture.

This module uses a predefined resource group, virtual network, subnet, and network security group. 

## Important Notice
<img src="https://github.com/intel/terraform-intel-azure-mssql-managed-instance/blob/main/images/important_notice_mssql_managed_instance.png?raw=true" alt="Important Notice" width="600"/>

## **Provisioning an Azure MSSQL Managed Instance can take up to 6 hours!**
More information can be found [Overview of Azure SQL Managed Instance management operations.](https://learn.microsoft.com/en-us/azure/azure-sql/managed-instance/management-operations-overview?view=azuresql)

## Performance Data

#### [Get up to 37% More SQL Server OLTP Performance by Selecting Premium Series Microsoft Azure SQL Managed Instance VMs With 3rd Gen Intel Xeon Scalable Processors](https://www.intel.com/content/www/us/en/content-details/755166/get-up-to-37-more-sql-server-oltp-performance-by-selecting-premium-series-microsoft-azure-sql-managed-instance-vms-with-3rd-gen-intel-xeon-scalable-processors.html)

<img src="https://github.com/intel/terraform-intel-azure-mssql-managed-instance/blob/main/images/perfdata1.png" alt="Normalized 16 vCPU MS SQL NOPM" width="350"/>
#
<img src="https://github.com/intel/terraform-intel-azure-mssql-managed-instance/blob/main/images/perfdata2.png" alt="Normalized 8 vCPU MS SQL NOPM" width="350"/>


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
  source                       = "intel/azure-mssql-managed-instance/intel"
  administrator_login_password = var.administrator_login_password
  resource_group_name          = "resource_group_example"
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






<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~>3.67 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | ~>3.67 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_mssql_managed_instance.mssql_managed_instance](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mssql_managed_instance) | resource |
| [azurerm_network_security_group.nsg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/network_security_group) | data source |
| [azurerm_resource_group.rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) | data source |
| [azurerm_subnet.subnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subnet) | data source |
| [azurerm_virtual_network.vnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/virtual_network) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_administrator_login"></a> [administrator\_login](#input\_administrator\_login) | The administrator login name for the new server | `string` | n/a | yes |
| <a name="input_administrator_login_password"></a> [administrator\_login\_password](#input\_administrator\_login\_password) | The password associated with the administrator\_login user | `string` | n/a | yes |
| <a name="input_azurerm_resource_group_name"></a> [azurerm\_resource\_group\_name](#input\_azurerm\_resource\_group\_name) | Name of the resource group to be imported | `string` | n/a | yes |
| <a name="input_azurerm_subnet_name"></a> [azurerm\_subnet\_name](#input\_azurerm\_subnet\_name) | The name of the preconfigured subnet | `string` | n/a | yes |
| <a name="input_azurerm_virtual_network_name"></a> [azurerm\_virtual\_network\_name](#input\_azurerm\_virtual\_network\_name) | Name of the preconfigured virtual network | `string` | n/a | yes |
| <a name="input_license_type"></a> [license\_type](#input\_license\_type) | What type of license the managed instance will use. Possible values are LicenseIncluded and BasePrice | `string` | `"LicenseIncluded"` | no |
| <a name="input_mi_name"></a> [mi\_name](#input\_mi\_name) | The name of the managed instance to be created | `string` | n/a | yes |
| <a name="input_nsg_name"></a> [nsg\_name](#input\_nsg\_name) | The name of the network security group to be imported | `string` | n/a | yes |
| <a name="input_sku_name"></a> [sku\_name](#input\_sku\_name) | The SKU that will be configured for the provisioned virtual machine. Possible values are GP\_Gen4, GP\_Gen5, GP\_Gen8IM, GP\_Gen8IH, BC\_Gen4, BC\_Gen5, BC\_Gen8IM or BC\_Gen8IH | `string` | `"GP_Gen8IH"` | no |
| <a name="input_storage_size_in_gb"></a> [storage\_size\_in\_gb](#input\_storage\_size\_in\_gb) | The maximum size of storage to be configured on the virtual machine. This should be a multiple of 32 GB | `number` | `256` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to the resource | `map(any)` | `{}` | no |
| <a name="input_vcore_count"></a> [vcore\_count](#input\_vcore\_count) | Number of cores that should be assigned to the SQL Managed Instance. Values can be 8, 16, or 24 for Gen4 SKUs, or 4, 8, 16, 24, 32, 40, 64, or 80 for Gen5 SKUs. | `number` | `8` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_administrator_login"></a> [administrator\_login](#output\_administrator\_login) | MSSQL managed instance administrator username |
| <a name="output_license_type"></a> [license\_type](#output\_license\_type) | The type of license the instance used |
| <a name="output_location"></a> [location](#output\_location) | Location where the virtual machine will be created |
| <a name="output_managed_instance_id"></a> [managed\_instance\_id](#output\_managed\_instance\_id) | The ID of the managed instance |
| <a name="output_network_security_group_id"></a> [network\_security\_group\_id](#output\_network\_security\_group\_id) | The ID of the preconfigured virtual network |
| <a name="output_resource_group_name"></a> [resource\_group\_name](#output\_resource\_group\_name) | The resource group where the instance resides |
| <a name="output_sku_name"></a> [sku\_name](#output\_sku\_name) | Instance SKU in use for the managed instance that was created |
| <a name="output_storage_size_in_gb"></a> [storage\_size\_in\_gb](#output\_storage\_size\_in\_gb) | The number of GBs associated with the instance |
| <a name="output_subnet_id"></a> [subnet\_id](#output\_subnet\_id) | The ID of the preconfigured subnet |
| <a name="output_tags"></a> [tags](#output\_tags) | The tags associated with the instance |
| <a name="output_timeouts"></a> [timeouts](#output\_timeouts) | The timeout constraints associated with the instance if configured |
| <a name="output_vcores"></a> [vcores](#output\_vcores) | Number of vcores on the managed instance |
| <a name="output_virtual_network_id"></a> [virtual\_network\_id](#output\_virtual\_network\_id) | The ID of the preconfigured virtual network |
| <a name="output_vm_name"></a> [vm\_name](#output\_vm\_name) | The name of the instance being created |
<!-- END_TF_DOCS -->
