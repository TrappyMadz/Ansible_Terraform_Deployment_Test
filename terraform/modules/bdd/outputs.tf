output "db_vm_ram" {
  value       = proxmox_virtual_environment_vm.bdd.memory[0].dedicated
  description = "Memory of database vm"
}

output "db_vm_vcpu_count" {
  value       = proxmox_virtual_environment_vm.bdd.cpu[0].cores
  description = "Number of vCPU in the database"
}

output "db_vm_disk_size" {
  value       = proxmox_virtual_environment_vm.bdd.disk[0].size
  description = "database disk size"
}

output "db_vm_os" {
  value       = data.proxmox_virtual_environment_file.vm_iso.file_name
  description = "OS used by the database"
}

output "db_vm_name" {
  value       = proxmox_virtual_environment_vm.bdd.name
  description = "Virtual machine name on proxmox interface."
}

output "db_vm_ip_address" {
  value       = split("/", proxmox_virtual_environment_vm.bdd.initialization[0].ip_config[0].ipv4[0].address)[0]
  description = "The vm ip address after booting up, without the '/24'"
}

output "db_vm_username" {
  value       = proxmox_virtual_environment_vm.bdd.initialization[0].user_account[0].username
  description = "The linux login for the database vm"
}