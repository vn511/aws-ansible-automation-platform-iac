# Operating Model

## Change lifecycle (target)

1. Propose a small change in a feature branch and open a pull request.
2. Review IaC, automation, security impact, test evidence, and rollback steps.
3. Merge only after required checks and reviewer approval.
4. For a future deployment, select an approved environment and patch wave; confirm the maintenance window and change record.
5. Run prechecks and application drain/stop actions, patch a canary, validate, then proceed in controlled waves.
6. Capture host-level outcomes, versions, timestamps, failures, and recovery actions; publish a sanitized summary to the change record.
7. Escalate partial failures rather than silently continuing or reporting fleet-wide success.

## Roles and responsibilities

- **Contributor:** proposes changes and supplies validation evidence and recovery notes.
- **Reviewer/approver:** checks safety, scope, and change authorization; approves protected environment deployments.
- **Operator:** confirms maintenance window and target wave, monitors execution, and coordinates escalation.
- **Service owner:** validates application health and accepts service restoration.

This describes the intended portfolio model. No operational control plane or live change process is configured in the current repository.
