########################
####     Intel      ####
########################
variable "sku_name" {
  description = "The SKU that will be configured for the provisioned virtual machine"
  type        = string
  default     = "GP_Gen5"
}

variable "storage_size_gb" {
  description = "The size of storage to be configured on the virtual machine"
  type        = number
  default     = 256
}

variable "vcore_count" {
  description = ""
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
# variable "subnet_id" {
#   description = "The subnet resource id that the SQL Managed instance will be associated with."
#   type        = string
#   default     = null
# }



########################
####    Required    ####
########################

variable "administrator_login" {
  description = "The administrator login name for the new server"
  type        = string
  default     = "_ccedbg"
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
    owner    = "owner@company.com"
    duration = "4"
  }
}