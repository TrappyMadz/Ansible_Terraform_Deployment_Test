module "bdd" {
    source = "./modules/bdd"

    # Data base virtual machine variables
    VM_DB_id = var.VM_DB_id
    VM_DB_name = var.VM_DB_name
    VM_DB_network_name = var.VM_DB_network_name
    VM_DB_ip_address = var.VM_DB_ip_address
    VM_DB_gateway_address = var.VM_DB_gateway_address
    VM_DB_node_name = var.VM_DB_node_name
    VM_DB_ram = var.VM_DB_ram
    VM_DB_vcpu = var.VM_DB_vcpu
    VM_DB_disk_size = var.VM_DB_disk_size
    VM_DB_disk_data_store_id = var.VM_DB_disk_data_store_id
    VM_DB_disk_interface = var.VM_DB_disk_interface
    VM_DB_img_file_type = var.VM_DB_img_file_type
    VM_DB_img_data_store_id = var.VM_DB_img_data_store_id
    VM_DB_img_file_name = var.VM_DB_img_file_name
    VM_DB_user_account_username = var.VM_DB_user_account_username
    VM_DB_user_account_password = var.VM_DB_user_account_password
    VM_DB_ssh_key_path = var.VM_DB_ssh_key_path
    VM_DB_qemu_agent_snippet_datastore_name = var.VM_DB_qemu_agent_snippet_datastore_name
    VM_DB_qemu_snippet_file_name = var.VM_DB_qemu_snippet_file_name
}