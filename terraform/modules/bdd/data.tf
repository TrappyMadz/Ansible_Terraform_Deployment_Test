data "proxmox_virtual_environment_file" "vm_iso" {
  content_type = var.VM_DB_img_file_type
  datastore_id = var.VM_DB_img_data_store_id
  node_name    = var.VM_DB_node_name
  file_name    = var.VM_DB_img_file_name
}

data "local_file" "ssh_public_key" {
  filename = var.VM_DB_ssh_key_path
}
