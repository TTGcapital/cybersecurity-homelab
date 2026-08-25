# Project 02 — Ubuntu Recovery and Server Administration

## Objective

Recover an inaccessible Ubuntu VM, restore networking, and turn it into a managed internal server.

## Recovery

GRUB recovery mode was used to enter system maintenance, identify the local user from `/home`, remount the filesystem read/write, and reset the account password. No installation or deletion was performed.

## Network fault

`ens18` was up but had only an IPv6 link-local address, and `ip route` had no IPv4 route. Netplan matched the NIC but did not enable DHCP.

After adding `dhcp4: true`, the configuration was checked and applied:

```bash
sudo netplan generate
sudo netplan apply
```

Ubuntu received `192.168.1.103/24` and a default route through pfSense.

## Server configuration

- Enabled OpenSSH and verified remote login from Kali.
- Renamed the host to `lab-srv01`.
- Created a pfSense DHCP reservation at `192.168.1.10`.
- Created stopped-state Proxmox snapshot `baseline-network-ssh`.

## Validation

```text
ens18 UP 192.168.1.103/24
default via 192.168.1.1 dev ens18 proto dhcp
```

After reservation and reboot, SSH succeeded at `192.168.1.10`.

## Lesson

An interface being up does not prove Layer 3 configuration works. Interface state, addressing, routing and service state must be tested separately.
