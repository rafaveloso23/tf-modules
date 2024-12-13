variable "environment" {
    type = string
    default = null
}

variable "client_id" {
    type = string
    default = null
}

variable "workspaces" {
    type = string
    default = null
}

variable "rg_novo" {
  description = "Indicates whether to create a new resource group"
  type        = bool
  default     = true
}

variable "rg_existente" {
  description = "Indicates whether to use an existing resource group"
  type        = bool
  default     = false
}

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