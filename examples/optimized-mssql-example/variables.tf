variable "administrator_login_password" {
  description = "Password for the admin login user."
  type        = string
  sensitive   = true
}
variable "mi_name" {
  description = "The name of the SQL Managed Instance"
  type        = string
  default     = "terraformtestingexample"
}

variable "vcore_count" {
  description = "The number of vCores for the SQL Managed Instance"
  type        = number
  default     = 8
}
