# My home operations repository

## Overview

This is a repository that I use for managing most of the IT infrastructure at home, thanks to methodologies like Infrastructure as Code (IaC) and GitOps. This is also where I keep an inventory of my equipment.

It is based on the template [onedr0p/flux-cluster-template](https://github.com/onedr0p/flux-cluster-template). I highly recommend using the template if you wish to start your own.

## Kubernetes nodes

All Kubernetes nodes are provisioned as Proxmox VMs with the following specifications:

* 8 cores
* 16GB RAM
* Debian 12 (Bookworm), cloud-init
* 24GB disk space

## Hardware

Except for the Pis, all machines are connected through 10Gb fiber or copper networking. Tables are sorted by how they are placed in the racks.

### Main Rack

| Hostname        | Device                      | CPU                  | RAM        | Storage                                         | Operating System      | Function                                                  |
|-----------------|-----------------------------|----------------------|------------|-------------------------------------------------|-----------------------|-----------------------------------------------------------|
| quadron-ccr2004 | Mikrotik CCR2004-1G-12S+2XS |                      |            |                                                 | RouterOS 7.12         | Edge Router                                               |
| quadron-crs328  | Mikrotik CRS328-24P-4S+RM   |                      |            |                                                 | RouterOS 7.12         | PoE Switch                                                |
| rockpi-[1-8]    | Rock Pi Model 4A+           | RK3399/OP1 3P3E      | 4GB LPDDR4 | 256GB NVMe                                      | Armbian 23.8 Bookworm | KVM, ~~Kubernetes~~                                       |
|                 | RMG-SR11901-HDM             |                      |            |                                                 |                       | KVM Console                                               |
| shibuya         | Dell PowerEdge R530         | E5-2620v3 6C/12T     | 128GB DDR4 | 16GB USB, 256GB SSD, 8x 8TB SATA                | Proxmox 8.0           | NAS, UPS metrics, VoIP, Pihole                            |
| server0[5-7]    | Hyve Zeus                   | 2x E5-2620v2 12C/24T | 32GB DDR3  | 2x 256GB SSD                                    | Proxmox 7.0           | *Retired.* ~~Kubernetes, VMs~~                            |
| shinjuku        | HPE ProLiant DL380 G9       | 2x E5-2640v3 16C/32T | 192GB DDR4 | 16GB USB, 256GB SSD, 2x 512GB SSD, 6x 600GB SAS | Proxmox 8.0           | VMs, build server, bootstrapping                          |
| akihabara       | Supermicro SC847            | 2x E5-2620v3 12C/24T | 64GB DDR4  | 2x 256GB SSD, 8x 4TB SAS, 4x 8TB SATA           | Proxmox 8.0           | Backup (will be NAS when current NAS nears full capacity) |
| server04        | Generic 2U Whitebox         | i5-4590 4C/4T        | 16GB DDR3  | 2x 128GB SSD                                    | Proxmox 6.0           | *Retired.* ~~CCTV~~                                       |

### Home Office Rack

| Hostname        | Device                      | CPU                  | RAM        | Storage                                         | Operating System      | Function                                                  |
|-----------------|-----------------------------|----------------------|------------|-------------------------------------------------|-----------------------|-----------------------------------------------------------|
| quadron-crs317  | Mikrotik CRS317-1G-16S+     |                      |            |                                                 | RouterOS 7.12         | Home Office Switch                                        |
| quadron-css610  | Mikrotik CSS610-8P-2S+IN    |                      |            |                                                 | SwOS Lite 2.16        | PoE Switch                                                |
| nippori         | HP Elite Mini 600 G9        | i5-12500T 6C/12T     | 96GB DDR5  | 16GB USB, 2x 256GB NVMe                         | Proxmox 8.0           | Kubernetes, Home Assistant, Jellyfin                      |
| ueno            | HP Elite Mini 600 G9        | i5-12500T 6C/12T     | 96GB DDR5  | 16GB USB, 2x 256GB NVMe                         | Proxmox 8.0           | Kubernetes                                                |
| kanda           | HP Elite Mini 600 G9        | i5-12500T 6C/12T     | 96GB DDR5  | 16GB USB, 2x 256GB NVMe                         | Proxmox 8.0           | Kubernetes, CCTV, UPS metrics                             |
| yurakucho       | HP Elite Mini 600 G9        | i5-12500T 6C/12T     | 96GB DDR5  | 16GB USB, 2x 512GB NVMe                         | Proxmox 8.0           | VMs                                                       |
| JJ's Mac Studio | Apple Mac Studio            | M2 Max 8P4E          | 32GB       | 512GB SSD                                       | macOS Sonoma          | Main PC, development                                      |