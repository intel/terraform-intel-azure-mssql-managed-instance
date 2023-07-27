########################
####     Intel      ####
########################
# See policies.md, we recommend  Intel Xeon 3rd Generation Scalable processors (code-named Ice Lake)
# General Purpose: Gen5_v4, Gen5_v8, Gen5_v16, Gen5_v16, Gen5_v24, Gen5_v32, Gen5_v40, Gen5_v64, Gen5_v80, G8IM_v4, G8IM_v8, G8IM_v16, G8IM_v24, G8IM_v32, G8IM_v40, G8IM_v64, G8IM_v80, G8IH_v4, G8IH_v4, G8IH_v8, G8IH_v16, G8IH_v24, G8IH_v32, G8IH_v40, G8IH_v64
# Memory Optimized: Gen5_v4, Gen5_v8, Gen5_v16, Gen5_v16, Gen5_v24, Gen5_v32, Gen5_v40, Gen5_v64, Gen5_v80, G8IM_v4, G8IM_v8, G8IM_v16, G8IM_v24, G8IM_v32, G8IM_v40, G8IM_v64, G8IM_v80, G8IH_v4, G8IH_v4, G8IH_v8, G8IH_v16, G8IH_v24, G8IH_v32, G8IH_v40, G8IH_v64
# See more:
# https://learn.microsoft.com/en-us/azure/azure-sql/database/service-tiers-sql-database-vcore?view=azuresql-db
# https://azure.microsoft.com/en-us/pricing/details/azure-sql-managed-instance/single/
variable "sku_name" {
  description = "The SKU that will be configured for the provisioned virtual machine. Possible values are GP_Gen4, GP_Gen5, GP_Gen8IM, GP_Gen8IH, BC_Gen4, BC_Gen5, BC_Gen8IM or BC_Gen8IH"
  type        = string
  default     = "GP_Gen5"
}

variable "storage_size_in_gb" {
  description = "The maximum size of storage to be configured on the virtual machine. This should be a multiple of 32 GB"
  type        = number
  default     = 256
}

variable "vcore_count" {
  description = "Number of cores that should be assigned to the SQL Managed Instance. Values can be 8, 16, or 24 for Gen4 SKUs, or 4, 8, 16, 24, 32, 40, 64, or 80 for Gen5 SKUs."
  type        = number
  default     = 8
}

variable "license_type" {
  description = "What type of license the managed instance will use. Possible values are LicenseIncluded and BasePrice"
  type        = string
  default     = "LicenseIncluded"
}

########################
####    Required    ####
########################

variable "administrator_login" {
  description = "The administrator login name for the new server"
  type        = string
}

variable "administrator_login_password" {
  description = "The password associated with the administrator_login user"
  type        = string
  sensitive   = true
  validation {
    condition     = length(var.administrator_login_password) >= 8
    error_message = "The administrator_login_password value must be at least 8 characters in length"
  }
}

variable "azurerm_resource_group_name" {
  description = "Name of the resource group to be imported"
  type        = string
}


variable "azurerm_virtual_network_name" {
  description = "Name of the preconfigured virtual network"
  type        = string
}

variable "azurerm_subnet_name" {
  description = "The name of the preconfigured subnet"
  type        = string

}

variable "nsg_name" {
  description = "The name of the network security group to be imported"
  type        = string
}

variable "mi_name" {
  description = "The name of the managed instance to be created"
  type        = string
}

########################
####     Other      ####
########################


variable "tags" {
  description = "A mapping of tags to assign to the resource"
  type        = map(any)
  default = {
    owner    = "owner@company.com"
    duration = "4"
  }
}
