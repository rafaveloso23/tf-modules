variable "key_vault_id" {
  type    = string
}

variable "access_policies" {
  type = map(object({
    object_id          = string
    key_permissions    = list(string)
    secret_permissions = list(string)
    certificate_permissions = list(string)
  }))
  default = {}
}

variable "specific_object_id" {
  type = string
}
