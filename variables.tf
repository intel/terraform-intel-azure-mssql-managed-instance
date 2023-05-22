########################
####     Intel      ####
########################
variable "sku_name" {
  description = "The SKU that will be configured for the provisioned virtual machine"
  type        = string
  default     = "GP_Gen5"
}

variable "storage_size_in_gb" {
  description = "The size of storage to be configured on the virtual machine"
  type        = number
  default     = 256
}

variable "vcore_count" {
  description = "Number of cores that should be assigned to the SQL Managed Instance. Values can be 8, 16, or 24 for Gen4 SKUs, or 4, 8, 16, 24, 32, 40, 64, or 80 for Gen5 SKUs."
  type        = number
  default     = 8
}

variable "edition" {
  description = ""
  type        = string
  default     = "GeneralPurpose"
}
variable "license_type" {
  description = ""
  type        = string
  default     = "LicenseIncluded"
}



########################
####    Required    ####
########################

variable "administrator_login" {
  description = "The administrator login name for the new server"
  type        = string
  default     = "sqladmin"
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
  default     = "kinder-testing"
}

variable "azurerm_resource_group_name_failover" {
  description = "Name of the resource group to be imported in the secondary location"
  type        = string
  default     = "testingkw"
}


variable "azurerm_virtual_network_name" {
  description = "Name of the preconfigured virtual network"
  type        = string
  default     = "kinder-testing"
}

variable "azurerm_subnet_name" {
  description = "The name of the preconfigured subnet"
  type        = string
  default     = "default"

}

variable "nsg_name" {
  description = ""
  type        = string
  default     = "kinder-testing"
}

########################
####     Other      ####
########################

variable "vm_name" {
  description = "The unique name of the Linux virtual machine"
  type        = string
  default     = "vm1"
}

variable "tags" {
  description = "A mapping of tags to assign to the resource"
  type        = map(any)
  default = {
    owner    = "kinder.wischmeier@intel.com"
    duration = "4"
  }
}
