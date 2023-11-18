# General

variable "cluster_name" {
  type = string
  description = "The name of the cluster"
}
variable "num_nodes" {
  type = number
  description = "The number of nodes"
}
variable "pods_cidr" {
  type = string
  description = "Pods CIDR"
  default = "10.42.0.0/16"
}
variable "username" {
  type = string
}

# Proxmox

## Credentials
variable "proxmox_api_url" {
  type = string
}
variable "proxmox_api_token_id" {
  type = string
}
variable "proxmox_api_token_secret" {
  type = string
}

## Cloud-init
variable "template_name" {
  type = string
  description = "The name of the cloud-init template to use for creating the VM"
}
variable "vm_tag" {
  type = string
  description = "The tag to set for the VM"
  default = ""
}
variable "ssh_key" {
  type = string
  description = "The SSH key to use for accessing the VM"
}