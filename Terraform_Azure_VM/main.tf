module "azure_vm" {
  source = "./modules/azure_vm_module"  # Path to your module

  resource_group_name = "ShazmaBanu-RG"
  location            = "East US"
  vnet_name           = "myVNet"
  vnet_address_space  = ["10.0.0.0/16"]
  subnet_name         = "mySubnet"
  subnet_address_prefix = ["10.0.1.0/24"]
  nic_name            = "myNIC"
  nic_ip_configuration_name = "myIPConfig"
  vm_name             = "myVM"
  vm_size             = "Standard_B1s"
  availability_set_id = null
  vm_image_publisher  = "MicrosoftWindowsServer"
  vm_image_offer      = "WindowsServer"
  vm_image_sku        = "2019-Datacenter"
  vm_image_version    = "latest"
  admin_username      = "adminuser"
  admin_password      = "adminpassword123!"
  tags = {
    Environment = "Dev"
  }
}
