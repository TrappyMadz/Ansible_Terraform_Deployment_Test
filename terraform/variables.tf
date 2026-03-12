# Proxmox identifiaction
variable "PROXMOX_VE_ENDPOINT" {
  type        = string
  description = "The endpoint wich will be used for proxmox"
}

variable "PROXMOX_VE_USERNAME" {
  type        = string
  description = "Proxmox login"
}

variable "PROXMOX_VE_PASSWORD" {
  type        = string
  sensitive = true
  description = "Proxmox password"
}


# Data base virtual machine variables
variable "VM_DB_id" {
  type        = number
  description = "Data base virtual machine's id"
}

variable "VM_DB_name" {
  type        = string
  description = "Data base virtual machine's name"
}

variable "VM_DB_network_name" {
  type        = string
  description = "Data base virtual machine's network name"
}

variable "VM_DB_ip_address" {
  type        = string
  description = "Data base virtual machine's ip address. Must be in 'X.X.X.X/XX' (CIDR) format."
}

variable "VM_DB_gateway_address" {
  type        = string
  description = "Data base virtual machine's ip address. Should be the same as ip address except for a 1 for the last digit."
}


variable "VM_DB_node_name" {
  type        = string
  description = "Data base virtual machine's node name"
}

variable "VM_DB_ram" {
  type        = number
  default     = 2048
  description = "Data base virtual machine's memory"
}

variable "VM_DB_vcpu" {
  type        = number
  default     = 1
  description = "Data base virtual machine's vCPUs count"
}

variable "VM_DB_disk_size" {
  type        = number
  default     = 20
  description = "Data base virtual machine's disk size"
}

variable "VM_DB_disk_data_store_id" {
  type        = string
  default     = "local-lvm"
  description = "Data base virtual machine's disk location"
}

variable "VM_DB_disk_interface" {
  type        = string
  default     = "virtio0"
  description = "Data base virtual machine's disk interface"
}

variable "VM_DB_img_file_type" {
  type        = string
  default     = "iso"
  description = "Data base virtual machine's boot image type"
}

variable "VM_DB_img_data_store_id" {
  type        = string
  default     = "local"
  description = "Data base virtual machine's boot image location"
}

variable "VM_DB_img_file_name" {
  type        = string
  default     = "jammy-server-cloudimg-amd64.img"
  description = "Data base virtual machine's boot image name"
}

variable "VM_DB_user_account_username" {
  type        = string
  default     = "db_user"
  description = "Data base virtual machine's linux login"
}

variable "VM_DB_user_account_password" {
  type        = string
  sensitive = true
  description = "Data base virtual machine's linux password"
}

variable "VM_DB_ssh_key_path" {
  type        = string
  description = "Path to your public ssh key file for database connection"
}

variable "VM_DB_qemu_agent_snippet_datastore_name" {
  type        = string
  default     = "local"
  description = "Were the qemu snippet for the database will be saved"
}

variable "VM_DB_qemu_snippet_file_name" {
  type        = string
  description = "Qemu snippet name for the database"
}