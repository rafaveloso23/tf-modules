variable "kv_novo" {
  type = bool
  validation {
    condition     = !(var.kv_novo && var.kv_existente)
    error_message = "You cannot set both 'kv_novo' and 'kv_existente' to true at the same time."
  }
}

variable "kv_existente" {
  type    = bool
  default = false
}


variable "name" {
  type = string
}

variable "location" {
  type    = string
  default = null
}

variable "rg_name" {
  type = string
}

variable "soft_delete_retention_days" {
  type = number
  default = null
}

variable "purge_protection_enabled" {
  type    = bool
  default = null
}

variable "sku_name" {
  type    = string
  default = null
}
