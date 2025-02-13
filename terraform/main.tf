resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.vnet_address_space
}

resource "azurerm_subnet" "subnet" {
  name                 = var.subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.subnet_address_prefix
}

resource "azurerm_network_interface" "nic" {
  name                = var.nic_name
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = var.nic_ip_configuration_name
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_virtual_machine" "vm" {
  name                  = var.vm_name
  resource_group_name   = var.resource_group_name
  location              = var.location
  vm_size               = var.vm_size
  network_interface_ids = [azurerm_network_interface.nic.id]
  tags                  = var.tags

  # OS Profile block for Windows or Linux
  os_profile {
    computer_name  = var.vm_name
    admin_username = var.admin_username
    admin_password = var.admin_password
  }

  dynamic "storage_image_reference" {
    for_each = var.os_type == "Windows" || var.os_type == "Linux" ? [1] : []
    content {
      publisher = var.os_type == "Windows" ? var.windows_publisher : var.linux_publisher
      offer     = var.os_type == "Windows" ? var.windows_offer : var.linux_offer
      sku       = var.os_type == "Windows" ? var.windows_sku : var.linux_sku
      version   = var.os_type == "Windows" ? var.windows_version : var.linux_version
    }
  }

  # OS Disk configuration
  storage_os_disk {
    name              = "${var.vm_name}-osdisk"
    disk_size_gb      = 30
    create_option     = "FromImage"
    os_type           = var.os_type  # "Windows" or "Linux"
    caching           = "ReadWrite"
    managed_disk_type = var.storage_account_type
  }

  # Conditionally add OS-specific configuration
  dynamic "os_profile_windows_config" {
    for_each = var.os_type == "Windows" ? [1] : []
    content {
      provision_vm_agent        = true
      enable_automatic_upgrades = true
    }
  }
  
  dynamic "os_profile_linux_config" {
    for_each = var.os_type == "Linux" ? [1] : []
    content {
      disable_password_authentication = false
    }
  }
}
