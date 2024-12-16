variable "rg_name" {
  description = "Base name for the resource group"
  type        = string
  default     = "rg-actions"
}

variable "rg_location" {
  description = "Azure region for the resource group"
  type        = string
  default     = "eastus"
}