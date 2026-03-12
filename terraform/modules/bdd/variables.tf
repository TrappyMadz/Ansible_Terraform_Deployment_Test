variable "VM_DB_name" {
  type        = string
  description = "Data base virtual machine's name"
}

variable "VM_DB_ip_address" {
  type        = string
  description = "Data base virtual machine's ip address"
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







