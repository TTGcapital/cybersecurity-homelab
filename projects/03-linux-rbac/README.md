# Project 03 — Linux Role-Based Access Control

## Scenario

A fictional organisation needs a shared directory for all employees and a Finance directory restricted to Finance staff.

## Implementation

Created `employees` and `finance` groups, plus fictional users `aisha` and `omar`. Aisha belongs to `employees`; Omar belongs to both groups.

```bash
sudo mkdir -p /srv/company/shared /srv/company/finance
sudo chown root:employees /srv/company/shared
sudo chown root:finance /srv/company/finance
sudo chmod 2770 /srv/company/shared
sudo chmod 2770 /srv/company/finance
```

The leading `2` enables setgid, causing new content to inherit the directory group.

## Access matrix

| Identity | Shared | Finance |
|---|---:|---:|
| Aisha | Allow | Deny |
| Omar | Allow | Allow |

## Validation

Tests used both `sudo -u <user>` and real SSH sessions. Aisha created shared content but received `Permission denied` for Finance. Omar created content in both directories. Listings confirmed inherited group ownership.

## Troubleshooting

Omar was initially denied access to Shared. `id omar` showed only `finance`. The missing group was appended safely:

```bash
sudo usermod -aG employees omar
```

Retesting succeeded. See the [incident record](../../troubleshooting/missing-group-membership.md).

## Security considerations

Least privilege was enforced, membership was verified, and no real employee information or production credentials were used.
