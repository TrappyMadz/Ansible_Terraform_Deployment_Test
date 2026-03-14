output "app_vm_ram" {
  value       = proxmox_virtual_environment_vm.app.memory[0].dedicated
  description = "Memory of application vm"
}

output "app_vm_vcpu_count" {
  value       = proxmox_virtual_environment_vm.app.cpu[0].cores
  description = "Number of vCPU in the application"
}

output "app_vm_disk_size" {
  value       = proxmox_virtual_environment_vm.app.disk[0].size
  description = "Application disk size"
}

output "app_vm_os" {
  value       = data.proxmox_virtual_environment_file.vm_iso.file_name
  description = "OS used by the application"
}

output "app_vm_name" {
  value       = proxmox_virtual_environment_vm.app.name
  description = "Virtual machine name on proxmox interface."
}

output "app_vm_ip_address" {
  value       = split("/", proxmox_virtual_environment_vm.app.initialization[0].ip_config[0].ipv4[0].address)[0]
  description = "The vm ip address after booting up, without the '/24'"
}

output "app_vm_username" {
  value       = proxmox_virtual_environment_vm.app.initialization[0].user_account[0].username
  description = "The linux login for the application vm"
}

output "app_vm_id" {
  value       = proxmox_virtual_environment_vm.app.id
  description = "VM id"
}