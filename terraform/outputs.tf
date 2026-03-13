output "app_vm_ram_output" {
  value       = module.app.app_vm_ram
  description = "Memory of application vm"
}

output "app_vm_vcpu_count_output" {
  value       = module.app.app_vm_vcpu_count
  description = "Number of vCPU in the application"
}

output "app_vm_disk_size_output" {
  value       = module.app.app_vm_disk_size
  description = "Application disk size"
}

output "app_vm_os_output" {
  value       = module.app.app_vm_os
  description = "OS used by the application"
}

output "app_vm_name_output" {
  value       = module.app.app_vm_name
  description = "Virtual machine name on proxmox interface."
}

output "app_vm_ip_address_output" {
  value       = module.app.app_vm_ip_address
  sensitive   = true
  description = "Application ip address."
}

output "app_vm_username_output" {
  value       = module.app.app_vm_username
  description = "The linux login for the application vm"
}

output "db_vm_ram_output" {
  value       = module.bdd.db_vm_ram
  description = "Memory of database vm"
}

output "db_vm_vcpu_count_output" {
  value       = module.bdd.db_vm_vcpu_count
  description = "Number of vCPU in the database"
}

output "db_vm_disk_size_output" {
  value       = module.bdd.db_vm_disk_size
  description = "Database disk size"
}

output "db_vm_os_output" {
  value       = module.bdd.db_vm_os
  description = "OS used by the database"
}

output "db_vm_name_output" {
  value       = module.bdd.db_vm_name
  description = "Virtual machine name on proxmox interface."
}

output "db_vm_ip_address_output" {
  value       = module.bdd.db_vm_ip_address
  sensitive   = true
  description = "database ip address."
}

output "db_vm_username_output" {
  value       = module.bdd.db_vm_username
  description = "The linux login for the database vm"
}





