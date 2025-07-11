variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "aks_cluster_name" {
  type = string
}

variable "dns_prefix" {
  type = string
}

variable "node_count" {
  type    = number
  default = 2
}
