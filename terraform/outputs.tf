output "vm_id" {
  description = "The ID of the virtual machine."
  value       = azurerm_virtual_machine.vm.id
}

output "vm_public_ip" {
  description = "The public IP address of the VM."
  value       = azurerm_network_interface.nic.ip_configuration[0].private_ip_address
}
