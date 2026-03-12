terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "0.98.1"
    }
  }
}

provider "proxmox" {
  endpoint = var.PROXMOX_VE_ENDPOINT

  username = var.PROXMOX_VE_USERNAME
  password = var.PROXMOX_VE_PASSWORD

  # because self-signed TLS certificate is in use
  insecure = true
}