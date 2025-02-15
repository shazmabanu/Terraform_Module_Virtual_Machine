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

variable "os_type" {
  description = "The OS type of the VM (Windows or Linux)."
  type        = string
}

variable "storage_account_type" {
  description = "The Storage Account type of the VM (Windows or Linux)."
  type        = string
}

# Windows-related image variables
variable "windows_publisher" {
  description = "Publisher for the Windows image"
  type        = string
}

variable "windows_offer" {
  description = "Offer for the Windows image"
  type        = string
}

variable "windows_sku" {
  description = "SKU for the Windows image"
  type        = string
}

variable "windows_version" {
  description = "Version of the Windows image"
  type        = string
}

# Linux-related image variables
variable "linux_publisher" {
  description = "Publisher for the Linux image"
  type        = string
}

variable "linux_offer" {
  description = "Offer for the Linux image"
  type        = string
}

variable "linux_sku" {
  description = "SKU for the Linux image"
  type        = string
}

variable "linux_version" {
  description = "Version of the Linux image"
  type        = string
}

#Admin Variables
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
