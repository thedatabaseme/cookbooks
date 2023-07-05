terraform {
  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = "2.9.14"
    }
  }
}

provider "proxmox" {
  pm_api_url          = "<PROXMOX_API_URL>"         # Proxmox API endpoint e.g. https://proxmox-server01.example.com:8006/api2/json
  pm_api_token_id     = "<PROXMOX_API_TOKEN_ID>"    # Generate API Token using the Proxmox WebUI
  pm_api_token_secret = "<PROXMOX_API_SECRET>"      # Secret access key, shown when generating the token using the Proxmox WebUI

  # Uncomment when using a self signed certificate
  # pm_tls_insecure     = true

  # Logging section, uncomment for enable logging
  # pm_log_enable       = true
  # pm_log_file         = proxmox_terraform.log
}

# Create a new blank VM
resource "proxmox_vm_qemu" "test-vm" {
  name        = "test-vm"
  target_node = "<PROXMOX_NODE>"
  clone       = "<SOURCE_CLONE_NAME>"   # VM name to clone from
  agent       = 1                       # 1 to enable QEMU agent

  memory      = 1024
  sockets     = 1
  cores       = 2
}