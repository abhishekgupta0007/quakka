variable "location" {
  description = "Azure region"
  type        = string
  default     = "centralindia"
}

variable "resource_group_name" {
  description = "Resource Group name prefix"
  type        = string
  default     = "demo-rg"
}

variable "acr_name_prefix" {
  description = "ACR name prefix (must be globally unique). A random suffix will be appended"
  type        = string
  default     = "demoacr"
}

variable "aks_name_prefix" {
  description = "AKS name prefix"
  type        = string
  default     = "demoaks"
}

variable "node_count" {
  description = "AKS node count"
  type        = number
  default     = 2
}

variable "node_vm_size" {
  description = "AKS node VM size"
  type        = string
  default     = "Standard_B2s"
}

