output "vm_id" {
  description = "The ID of the virtual machine."
  value       = module.azure_vm.vm_id
}

output "vm_public_ip" {
  description = "The public IP address of the VM."
  value       = module.azure_vm.vm_public_ip
}
