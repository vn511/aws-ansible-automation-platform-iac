# Disaster Recovery Runbook (Design Template)

> No AWS resources or automated recovery workflow exist in this starter repository.

## Recovery preparation

Before a future deployment, document service recovery objectives, infrastructure/state backups, artifact retention, account access, dependency owners, and a tested rebuild procedure. Keep recovery credentials outside Git and verify access through approved controls.

## Incident response outline

1. Declare the incident, identify the affected environment and change, and assign an incident lead.
2. Pause further patch waves and preserve Terraform plans, automation logs, and sanitized host evidence.
3. Assess service impact with the application owner; choose rollback, restore, or rebuild only under the approved recovery plan.
4. Restore the minimum required service, validate dependencies and monitoring, then communicate status to stakeholders.
5. Reconcile infrastructure state carefully before any subsequent Terraform operation; do not blindly re-apply after a partial failure.
6. Record timeline, impact, decisions, recovery evidence, and follow-up actions in the incident/change record.

Test recovery procedures in an isolated environment before relying on them operationally.
