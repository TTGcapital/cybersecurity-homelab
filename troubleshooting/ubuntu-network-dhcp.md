# Incident — Ubuntu Had No IPv4 Address

## Symptom

`ens18` showed `UP`, but only an IPv6 link-local address existed. There was no default route and SSH was unavailable remotely.

## Investigation

```bash
ip -br addr
ip route
sudo cat /etc/netplan/*.yaml
```

The NIC name and MAC match were correct, but the YAML contained no DHCP instruction.

## Root cause

The installer-generated Netplan file did not include `dhcp4: true`.

## Resolution

DHCP was added under `ens18`, then validated before applying:

```bash
sudo netplan generate
sudo netplan apply
```

An initial edit caused an inconsistent-indentation error. Spaces and alignment were corrected.

## Validation

Ubuntu received `192.168.1.103/24` with gateway `192.168.1.1`. A reservation later assigned `192.168.1.10`, and SSH from Kali succeeded.

## Lesson

Validate YAML before applying it and troubleshoot interface state, addressing, routing and application services as separate layers.
