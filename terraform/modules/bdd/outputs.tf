output "db_vm_ip_address" {
  value       = split("/", proxmox_virtual_environment_vm.bdd.initialization[0].ip_config[0].ipv4[0].address)[0]
  description = "The vm ip address after booting up, without the '/24'"
}

output "db_vm_username" {
  value = proxmox_virtual_environment_vm.bdd.initialization[0].user_account[0].username
  description = "The linux login for the database vm"
}
