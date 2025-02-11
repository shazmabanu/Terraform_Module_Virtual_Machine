resource "azurerm_resource_group" "resource_group" {
  name     = "ShazmaBanu-RG"
  location = var.location
}

resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  location            = azurerm_resource_group.resource_group.location  # Reference updated name
  resource_group_name = azurerm_resource_group.resource_group.name    # Reference updated name
  address_space       = var.vnet_address_space
}

resource "azurerm_subnet" "subnet" {
  name                 = var.subnet_name
  resource_group_name  = azurerm_resource_group.resource_group.name    # Reference updated name
  virtual_network_name = azurerm_virtual_network.vnet.name            # Reference updated name
  address_prefixes     = var.subnet_address_prefix
}

resource "azurerm_network_interface" "nic" {
  name                = var.nic_name
  location            = azurerm_resource_group.resource_group.location  # Reference updated name
  resource_group_name = azurerm_resource_group.resource_group.name    # Reference updated name
  subnet_id           = azurerm_subnet.subnet.id

  ip_configuration {
    name                          = var.nic_ip_configuration_name
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_virtual_machine" "vm" {
  name                  = var.vm_name
  location              = azurerm_resource_group.resource_group.location  # Reference updated name
  resource_group_name   = azurerm_resource_group.resource_group.name    # Reference updated name
  network_interface_ids = [azurerm_network_interface.nic.id]
  vm_size               = var.vm_size
  availability_set_id   = var.availability_set_id

  storage_image_reference {
    publisher = var.vm_image_publisher
    offer     = var.vm_image_offer
    sku       = var.vm_image_sku
    version   = var.vm_image_version
  }

  os_profile {
    computer_name  = var.vm_name
    admin_username = var.admin_username
    admin_password = var.admin_password
  }

  os_profile_windows_config {
    provision_vm_agent = true
    enable_automatic_upgrades = true
  }

  tags = var.tags
}
