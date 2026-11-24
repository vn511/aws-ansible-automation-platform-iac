# Patching Runbook (Design Template)

> This is a future-operating-model template, not an executable procedure. No patch playbook is implemented yet.

## Prerequisites

- Approved change record, scope, maintenance window, owner, and rollback decision-maker.
- Authorized AWS account, tested target inventory, backups/snapshots as appropriate, and working management connectivity.
- Confirmed package/update source, capacity, application dependencies, health checks, and recovery contacts.

## Execution outline

1. Verify approval and target tags; confirm the selected environment and patch wave. Stop if scope is empty or unexpected.
2. Run read-only connectivity, disk-space, service, and application health prechecks. Save timestamped evidence.
3. Drain the node from service and stop dependent application components in the documented order. Confirm stopped state.
4. Apply approved updates to a canary. Reboot only when required and wait for management connectivity to return.
5. Validate OS health, required services, application health, and monitoring. Start services in dependency order and restore traffic only after successful checks.
6. Expand to the next wave only after operator review of canary evidence.
7. Record per-host success/failure, update identifiers, reboot status, timestamps, and exceptions in the change record.

## Recovery and escalation

Do not hide partial failures or automatically retry disruptive actions without an explicit policy. Stop the affected wave, preserve logs, notify the service owner/change lead, and follow the approved recovery plan. See [Disaster Recovery](DR-RUNBOOK.md) and [Troubleshooting](TROUBLESHOOTING.md).
