#Terraform provider requirements and versions
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.67"
    }
  }
}


provider "azurerm" {
  features {}
}