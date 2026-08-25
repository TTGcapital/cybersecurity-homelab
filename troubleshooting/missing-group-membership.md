# Incident — Shared Directory Access Denied

## Symptom

Finance user `omar` could access Finance but could not create a file in the company shared directory.

## Investigation

```bash
id omar
getent group employees
ls -ld /srv/company/shared
```

Directory ownership and mode were correct. `id omar` showed only the Finance supplementary group.

## Root cause

The `employees` membership had not been applied.

## Resolution

```bash
sudo usermod -aG employees omar
```

The append flag matters: `-G` without `-a` can replace existing supplementary memberships.

## Validation

`id omar` showed both groups, and file creation succeeded in Shared and Finance through a real SSH session.
