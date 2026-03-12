output "db_vm_ip_address" {
  value       = split("/", proxmox_virtual_environment_vm.db_vm.initialization[0].ip_config[0].ipv4[0].address)[0]
  description = "The vm ip address after booting up, without the '/24'"
}
