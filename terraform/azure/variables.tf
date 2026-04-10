variable "resource_group_name" {
  description = "The prefix for the resource group name"
  type        = string
  default     = "Epic-book-rg-south"
}

variable "location" {
  description = "The Azure Region where resources will be deployed"
  type        = string
  default     = "southafricanorth"
}

variable "vm_size" {
  description = "The size of the Virtual Machine"
  type        = string
  default     = "Standard_B2ts_v2"
}

variable "admin_user" {
  description = "Admin username for the VM"
  type        = string
  default     = "azureuser"
}

variable "ssh_public_key_path" {
  description = "Path to the SSH public key for VM access"
  type        = string
  default     = "~/.ssh/azure_rsa.pub"
}

variable "common_tags" {
  description = "Standard tags for all resources"
  type        = map(string)
  default = {
    Environment = "Dev"
    Project     = "EpicBook Web Application"
    ManagedBy   = "Terraform"
  }
}

variable "db_name" {
  description = "Database name"
  type        = string
}

variable "db_admin_user" {
  description = "MySQL admin username"
  type        = string
}

variable "db_admin_password" {
  description = "MySQL admin password"
  type        = string
  sensitive   = true
}