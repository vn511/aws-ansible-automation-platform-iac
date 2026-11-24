# Enterprise AWS Automation Platform Reference Implementation

This portfolio project demonstrates a governed approach to infrastructure as code and Linux/Windows patch automation using Terraform, Ansible, Python, PowerShell, and GitHub Actions. Its focus is the full operating model—repeatable workflows, safety gates, validation, evidence, and useful runbooks—not just isolated playbooks.

> **Current status:** repository foundation only. No AWS resources are provisioned, no AWS account is required, and no patching workflow is production-ready. Terraform and Ansible scaffolding is intentionally safe to inspect and validate locally. Capabilities will be added in small, reviewable increments.

## Architecture

```text
Developer / reviewer
        │ pull request
        ▼
 GitHub Actions ─────── static validation
        │                         │
        ├── Terraform ────────────┴── AWS (future; no resources yet)
        │                                  VPC / private subnets / IAM / EC2
        └── Ansible (future)                SSM / CloudWatch / Secrets Manager
             │                             Linux + Windows patch waves
             └── dynamic AWS inventory     prechecks → patch → reboot → PIV
                                             evidence → ITSM adapter (simulated)
```

The portfolio uses Ansible Core and AWS collection-compatible examples. A production target could add Red Hat Ansible Automation Platform (Automation Controller, Private Automation Hub, and Automation Mesh), enterprise secrets management, BMC Helix or Jira Service Management, and Splunk. Those are design targets, not claims about integrations implemented here.

## Repository map

- `terraform/` — environment entry points and planned reusable AWS modules.
- `ansible/` — dynamic inventory configuration, playbooks, roles, and collection requirements.
- `scripts/` — local validation helpers and future inventory/health-check utilities.
- `docs/` — architecture, implementation plan, security model, operating model, and runbooks.
- `.github/workflows/` — pull-request validation; deployment workflows will be added only with safe approvals and AWS access.

## Start here

1. Read [Architecture](docs/ARCHITECTURE.md) and [Implementation plan](docs/IMPLEMENTATION.md).
2. Install Terraform, Python, Ansible Core, `ansible-lint`, and `yamllint` to run the local checks in `scripts/validate.sh`.
3. Install Ansible collections with `ansible-galaxy collection install -r ansible/requirements.yml` when testing playbooks.
4. Do not run `terraform apply` or real patch jobs. They are deliberately not implemented in this initial scaffold.

No AWS credentials, secrets, or organization access belong in this repository. See [Security](docs/SECURITY.md) before adding integrations.

## Capability roadmap

1. **Foundation (current):** documentation, safe Terraform environment shell, Ansible inventory/playbook conventions, and CI validation.
2. **AWS dev lab:** VPC, two private subnets, SSM-based access, IAM, tagged Linux targets, logging, and dynamic inventory. Requires an authorized AWS account and cost controls.
3. **Linux operations:** reusable baseline and patch roles, pre/post checks, reboot handling, and evidence output.
4. **Windows and application lifecycle:** WinRM connectivity, Windows patching, and controlled stop/start/health checks.
5. **Governance:** simulated REST/ITSM adapter, security scanning, environment approvals, and additional runbook evidence.

## Skills demonstrated

| Area | Portfolio evidence |
|---|---|
| IaC and AWS | Terraform environment and planned composable AWS modules |
| Configuration automation | Ansible roles, playbooks, and AWS dynamic inventory |
| Scripting | Python helpers, Bash validation, and PowerShell-oriented Windows workflows |
| CI/CD and governance | Pull-request checks and an approval-gated future deployment design |
| Operations | Patch, recovery, troubleshooting, and evidence runbooks |
| Security | Least-privilege intent, SSM-first access, and no committed credentials |

## Disclaimer

This is an educational reference implementation, not a supported product or a substitute for an organization's change, security, or operational controls. All cloud resources and production integrations are future work and must be reviewed before use.
