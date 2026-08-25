# Project 01 — Proxmox and pfSense Network Foundation

## Objective

Recover and validate an offline homelab while ensuring the deliberately vulnerable target remained isolated.

## Implementation

1. Inspected Proxmox host CPU, RAM, storage and version.
2. Verified pfSense `net0` used `vmbr0` and `net1` used `vmbr1`.
3. Verified `vmbr0` used physical `nic0` and hosted Proxmox at `192.168.0.100/24`.
4. Verified `vmbr1` had no physical port, IP or gateway.
5. Verified Kali, Ubuntu and Metasploitable used `vmbr1`.
6. Confirmed pfSense WAN `192.168.0.3/24` and LAN `192.168.1.1/24`.

## Validation

Kali obtained `192.168.1.100/24` and showed a default route through `192.168.1.1`. Four ICMP tests to pfSense completed with 0% packet loss, and its local dashboard was accessible from Kali.

## Security considerations

- Metasploitable remains exclusively on the internal bridge.
- No port forwarding was configured.
- The physical router had no internet during testing.
- Default pfSense credentials were replaced.

## Result

A working routed LAN with clear separation between management/WAN traffic and vulnerable workloads.
