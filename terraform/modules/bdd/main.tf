resource "proxmox_virtual_environment_vm" "db_vm" {
    stop_on_destroy = true
    
    name = var.VM_DB_name
    node_name = var.VM_DB_node_name

    cpu {
        cores = var.VM_DB_vcpu
    }
    memory {
        dedicated = var.VM_DB_ram
    }
    disk {
        datastore_id = var.VM_DB_disk_data_store_id
        file_id = data.proxmox_virtual_environment_file.vm_iso.id
        interface = var.VM_DB_disk_interface
        size = var.VM_DB_disk_size
    }

    initialization {
        ip_config {
            ipv4 {
                address = var.VM_DB_ip_address
                gateway = var.VM_DB_gateway_address
            }
        }
    }
}