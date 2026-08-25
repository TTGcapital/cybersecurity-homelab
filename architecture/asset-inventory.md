# Asset Inventory

| Asset | Role | Verified details |
|---|---|---|
| Proxmox host | Hypervisor | Proxmox VE 9.2.2; Intel Core i5-3470; 4 cores; 7.6 GiB usable RAM |
| pfSense | Router/firewall VM | 2.8.1; 1 GiB RAM; 2 vCPU; 20 GB disk; two NICs |
| Kali Linux | Admin/security VM | Recovered account; `192.168.1.100`; `vmbr1` |
| Ubuntu Server | Managed server | `lab-srv01`; reserved `192.168.1.10`; SSH active |
| Metasploitable 2 | Vulnerable target | Attached only to `vmbr1` |
| Physical router | Isolated network | No internet during documented work |
| MacBook Pro 2018 | Management endpoint | Proxmox web access |
| Acer system | Additional server hardware | Role still to be inventoried |

With 8 GB RAM, workloads are scheduled rather than all VMs running simultaneously.
