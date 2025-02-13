<<<<<<< HEAD
# Terraform_modules_for_AzureServices
=======
# Introduction

TODO: This module's purpose is to deploy a Virtual Machine

# Example Usage

`
module "azure_vm" {
  source = "../.."
  resource_group_name    = var.resource_group_name
  location               = var.location
  vnet_name              = var.vnet_name
  vnet_address_space     = var.vnet_address_space
  subnet_name            = var.subnet_name
  subnet_address_prefix  = var.subnet_address_prefix
  nic_name               = var.nic_name
  nic_ip_configuration_name = var.nic_ip_configuration_name
  vm_name                = var.vm_name
  vm_size                = var.vm_size
  os_type                = var.os_type
  storage_account_type   = var.storage_account_type
  linux_publisher        = var.linux_publisher
  linux_offer            = var.linux_offer
  linux_sku              = var.linux_sku
  linux_version          = var.linux_version
  windows_publisher      = var.windows_publisher
  windows_offer          = var.windows_offer
  windows_sku            = var.windows_sku
  windows_version        = var.windows_version
  admin_username         = var.admin_username
  admin_password         = var.admin_password
}
`

### Notable
N/A

## Owners
| Name |
|------|
|Shazma Banu|


# CHANGELOG
***

### Version 0.1.0
* Initial version
>>>>>>> 30349a4 (Updated TF Module to deploy VM in Azure)
