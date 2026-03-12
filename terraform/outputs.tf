output "db_vm_ip_address_output" {
  value       = module.bdd.db_vm_ip_address
  description = "Data base ip address."
}

output "db_vm_username_output" {
    value = module.bdd.db_vm_username
    description = "The linux login for the database v"
}

