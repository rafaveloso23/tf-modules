variable "internet_access" {
  type    = bool
  default = false
}

variable "cluster_name" {
  type    = string
}

locals {
  aks_cluster_name = var.internet_access ? "aks-cluster-02" : "aks-cluster-01"
}