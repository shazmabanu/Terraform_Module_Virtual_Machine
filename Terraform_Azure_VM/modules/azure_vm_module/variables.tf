variable "resource_group_name" {
  description = "The name of the resource group in which the VM will be created."
  type        = string
}

variable "location" {
  description = "The Azure region where resources will be created."
  type        = string
}

variable "vnet_name" {
  description = "The name of the Virtual Network."
  type        = string
}

variable "vnet_address_space" {
  description = "The address space of the virtual network."
  type        = list(string)
}

variable "subnet_name" {
  description = "The name of the Subnet."
  type        = string
}

variable "subnet_address_prefix" {
  description = "The address prefix of the subnet."
  type        = list(string)
}

variable "nic_name" {
  description = "The name of the Network Interface Card (NIC)."
  type        = string
}

variable "nic_ip_configuration_name" {
  description = "The name of the NIC IP configuration."
  type        = string
}

variable "vm_name" {
  description = "The name of the virtual machine."
  type        = string
}

variable "vm_size" {
  description = "The size of the virtual machine."
  type        = string
}

variable "availability_set_id" {
  description = "The availability set ID in which the VM will be placed."
  type        = string
  default     = null
}

variable "vm_image_publisher" {
  description = "The publisher of the VM image (e.g., 'MicrosoftWindowsServer')."
  type        = string
}

variable "vm_image_offer" {
  description = "The offer of the VM image (e.g., 'WindowsServer')."
  type        = string
}

variable "vm_image_sku" {
  description = "The SKU of the VM image (e.g., '2019-Datacenter')."
  type        = string
}

variable "vm_image_version" {
  description = "The version of the VM image (e.g., 'latest')."
  type        = string
}

variable "admin_username" {
  description = "The username for the VM administrator."
  type        = string
}

variable "admin_password" {
  description = "The password for the VM administrator."
  type        = string
  sensitive   = true
}

variable "tags" {
  description = "A map of tags to assign to the resources."
  type        = map(string)
  default     = {}
}
