# Cybersecurity Homelab

A hands-on cybersecurity lab built on Proxmox VE documenting 
my journey across offensive security, network infrastructure, 
virtualisation, and system administration.

## Lab Environment

| Component | Details |
|---|---|
| Hypervisor | Proxmox VE 9.2 on Dell OptiPlex 3010 |
| Firewall/Router | pfSense 2.8.1 |
| Attacker Machine | Kali Linux 2026.1 |
| Target 1 | Metasploitable 2 |
| Target 2 | Ubuntu Server 26.04 |
| Network | Isolated lab network via vmbr1 (192.168.1.x) |
| Management | Proxmox web UI accessed remotely from MacBook |

## Skills Demonstrated

**Infrastructure & Virtualisation**
- Deployed bare-metal hypervisor (Proxmox VE) on consumer hardware
- Configured multiple VMs with resource allocation
- Implemented VM snapshots for lab state management
- Managed storage across SSD and HDD

**Networking**
- Designed and implemented isolated lab network
- Configured pfSense firewall with WAN/LAN separation
- Set up DHCP server for lab network
- Created virtual network bridges (vmbr0, vmbr1)
- Implemented network segmentation to isolate attack traffic

**Offensive Security**
- Network scanning and host discovery (Nmap)
- Exploitation using Metasploit framework
- Reverse shell attacks using Netcat
- Linux privilege escalation techniques

**System Administration**
- Linux server configuration (Ubuntu Server, Kali, Debian)
- SSH configuration and remote access
- Disk management and partitioning
- Service configuration and troubleshooting

## Network Architecture
[MacBook] ──── [Home Router] ──── [Proxmox Host: 192.168.0.100]
│
├── pfSense VM (gateway)
│   ├── WAN: 192.168.0.198
│   └── LAN: 192.168.1.1
│
└── Isolated Lab Network (192.168.1.x)
├── Kali Linux (attacker)
├── Metasploitable 2 (target)
└── Ubuntu Server (target)

## Labs Completed

| Lab | Topic | Techniques |
|---|---|---|
| Lab 01 | Network Scanning | Nmap host discovery, port scanning |
| Lab 02 | Exploitation | Metasploit, gaining root access |
| Lab 03 | Reverse Shell | Netcat listener, shell access |
| Lab 04 | Privilege Escalation | Sudo misconfiguration, SUID binary abuse |

## Tools Used

Nmap · Metasploit · Netcat · SSH · pfSense · Proxmox · GTFOBins

## Certifications Being Pursued

- AWS Cloud Practitioner
- CompTIA Security+

## Goal

Build toward a career in cloud security engineering through 
hands-on lab work, documentation, and real infrastructure experience.
