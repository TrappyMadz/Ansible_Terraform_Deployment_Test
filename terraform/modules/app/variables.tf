variable "VM_APP_id" {
  type        = number
  description = "Application virtual machine's id"
}

variable "VM_APP_name" {
  type        = string
  description = "Application virtual machine's name"
}

variable "VM_APP_network_name" {
  type        = string
  description = "Application virtual machine's network name"
}

variable "VM_APP_ip_address" {
  type        = string
  sensitive   = true
  description = "Application virtual machine's ip address. Must be in 'X.X.X.X/XX' (CIDR) format."
}

variable "VM_APP_gateway_address" {
  type        = string
  sensitive   = true
  description = "Application virtual machine's ip address. Should be the same as ip address except for a 1 for the last digit."
}


variable "VM_APP_node_name" {
  type        = string
  description = "Application virtual machine's node name"
}

variable "VM_APP_ram" {
  type        = number
  default     = 1024
  description = "Application virtual machine's memory"
}

variable "VM_APP_vcpu" {
  type        = number
  default     = 1
  description = "Application virtual machine's vCPUs count"
}

variable "VM_APP_disk_size" {
  type        = number
  default     = 20
  description = "Application virtual machine's disk size"
}

variable "VM_APP_disk_data_store_id" {
  type        = string
  default     = "local-lvm"
  description = "Application virtual machine's disk location"
}

variable "VM_APP_disk_interface" {
  type        = string
  default     = "virtio0"
  description = "Application virtual machine's disk interface"
}

variable "VM_APP_img_file_type" {
  type        = string
  default     = "iso"
  description = "Application virtual machine's boot image type"
}

variable "VM_APP_img_data_store_id" {
  type        = string
  default     = "local"
  description = "Application virtual machine's boot image location"
}

variable "VM_APP_img_file_name" {
  type        = string
  default     = "jammy-server-cloudimg-amd64.img"
  description = "Application virtual machine's boot image name"
}

variable "VM_APP_user_account_username" {
  type        = string
  default     = "APP_user"
  description = "Application virtual machine's linux login"
}

variable "VM_APP_user_account_password" {
  type        = string
  sensitive   = true
  description = "Application virtual machine's linux password"
}

variable "VM_APP_ssh_key_path" {
  type        = string
  description = "Path to your public ssh key file for database connection"
}

variable "VM_APP_qemu_agent_snippet_datastore_name" {
  type        = string
  default     = "local"
  description = "Were the qemu snippet for the database will be saved"
}

variable "VM_APP_qemu_snippet_file_name" {
  type        = string
  description = "Qemu snippet name for the database"
}