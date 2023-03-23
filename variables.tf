########################
####     Intel      ####
########################
variable "sku_name" {
    description     = "The SKU that will be configured for the provisioned virtual machine"
    type            = string
    default         = "GP_Gen5_4"
}

variable "storage_size_gb" {
    description     = "The size of storage to be configured on the virtual machine"
    type            = number
    default         = 256
}

variable "vcore_count" {
    description     = ""
    type            = number
    default         = 4
}

variable "edition" {
    description     = ""
    type            = string
    default         = "GeneralPurpose"
}

variable "hardware_family" {
    description     = ""
    type            = string
    default         = "Intel"
}

variable "license_type" {
    description     = ""
    type            = string
    default         = "LicenseIncluded"
}
variable "subnet_id" {
    description     = "The subnet resource id that the SQL Managed instance will be associated with."
    type            = string
    default         = "d4ab7583-eee6-45fe-9487-a7a0b59a389a"
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
    type = string
}

variable "azurerm_virtual_network_name" {
    description = "Name of the preconfigured virtual network"
    type        = string
}

variable "azurerm_subnet_name" {
  description = "The name of the preconfigured subnet"
  type        = string
}




########################
####     Other      ####
########################

variable "vm_name" {
    description = "The unique name of the Linux virtual machine"
    type = string
    default = "vm1"
}

variable "tags" {
    description = "A mapping of tags to assign to the resource"
    type        = map(any)
    default = {
        owner = "owner@company.com"
        duration = "4"
  }
}
