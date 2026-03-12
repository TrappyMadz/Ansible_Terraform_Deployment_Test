resource "proxmox_virtual_environment_vm" "bdd" {
    stop_on_destroy = true
    
    vm_id = var.VM_DB_id
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

    network_device {
        bridge = var.VM_DB_network_name
    }

    initialization {
        ip_config {
            ipv4 {
                address = var.VM_DB_ip_address
                gateway = var.VM_DB_gateway_address
            }
        }

        user_account {
            username = var.VM_DB_user_account_username
            password = var.VM_DB_user_account_password
            keys = [trimspace(local.db_ssh_key)]
        }

        vendor_data_file_id = proxmox_virtual_environment_file.DB_VM_qemu_agent_install.id
    }

    agent {
        enabled = true
    }
}

resource "proxmox_virtual_environment_file" "DB_VM_qemu_agent_install" {
  content_type = "snippets"
  datastore_id = var.VM_DB_qemu_agent_snippet_datastore_name
  node_name    = var.VM_DB_node_name

  source_raw {
    data      = <<EOF
#cloud-config
package_update: true
packages:
  - qemu-guest-agent

runcmd:
  - systemctl enable --now qemu-guest-agent
EOF
    file_name = var.VM_DB_qemu_snippet_file_name
  }
}