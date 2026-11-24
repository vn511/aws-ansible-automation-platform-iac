# Security Model

## Current state

This scaffold has no AWS provider credentials, secrets, deployed resources, ITSM endpoint, or production automation. Do not add real credentials or sensitive environment data.

## Design requirements for future stages

- Use least-privilege IAM roles and short-lived GitHub OIDC credentials; do not use long-lived AWS access keys in repository secrets.
- Keep managed targets private and prefer Systems Manager over SSH/RDP ingress.
- Store passwords and API tokens in an approved secrets manager; pass references to automation, not secret values in source or logs.
- Protect deployment environments with reviewer approval, branch restrictions, and audit trails. Pull-request workflows must be read-only and must not execute untrusted code with deployment credentials.
- Restrict Terraform state access and encryption before adding a remote backend. Never commit state, plans, credentials, or generated sensitive evidence.
- Pin and review third-party Actions, providers, and Ansible collections before production use.
- Validate inventory scope and patch wave before any change; fail closed if approval, target selection, or health checks are missing.

Report suspected credential exposure through the repository's private reporting route or GitHub's security advisories. Do not open a public issue containing sensitive details.
