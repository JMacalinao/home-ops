# Commands:
# eval `ssh-agent -s`
# ssh-add ~/.ssh/id_ed25519
# terraform apply

terraform {
  required_version = ">= 1.1.5"

  required_providers {
    proxmox = {
      source = "Telmate/proxmox"
      version = "2.9.14"
    }
  }
}