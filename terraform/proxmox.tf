resource "proxmox_vm_qemu" "servers" {
  count = var.num_nodes
  name = "${var.cluster_name}-${count.index + 1}"
  target_node = "shinjuku" #var.proxmox_hosts[count.index]
  vmid = "885${count.index + 1}"

  clone = var.template_name
  tags = var.vm_tag

  agent = 1
  os_type = "cloud-init"
  cores = 8
  sockets = 1
  cpu = "host"
  memory = 16384
  scsihw = "virtio-scsi-pci"
  bootdisk = "scsi0"
  qemu_os = "other"
  onboot = true
  
  disk {
    slot = 0
    size = "24G"
    type = "scsi"
    storage = "local-zfs"
  }
  
  network {
    model = "virtio"
    bridge = "vmbr0"
    firewall = true
    tag = 88
  }
  
  lifecycle {
    ignore_changes = [
      network,
    ]
  }
  
  ipconfig0 = "ip=10.8.8.5${count.index + 1}/24,gw=10.8.8.1"
  
  ciuser = var.username
  sshkeys = <<EOF
  ${var.ssh_key}
  EOF
}