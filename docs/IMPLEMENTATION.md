# Implementation Plan

The project is intentionally incremental and does not require AWS access for its initial stage.

## Stage 1 — Repository foundation (current)

- Establish project narrative, repository layout, security boundaries, and operational documentation.
- Add Terraform environment configuration without cloud resources.
- Add AWS dynamic inventory configuration examples and safe connectivity-only playbooks.
- Validate formatting and syntax in local scripts and GitHub Actions.

## Stage 2 — AWS development foundation (requires an authorized AWS account)

- Add a VPC with two private subnets, routing, and narrowly scoped security groups.
- Add instance profiles and Systems Manager connectivity; avoid public management ports.
- Add a small Linux target, tags for environment/OS/application/patch wave, and log destinations.
- Add cost budgets, teardown instructions, and an explicit deployment approval gate before enabling apply.

## Stage 3 — Linux patching

Build reusable roles for prechecks, disk/service checks, patch installation, conditional reboot, postchecks, and evidence. Use handlers and fail visibly on unhealthy outcomes. Start with a disposable development target.

## Stage 4 — Windows and application lifecycle

Document and test WinRM prerequisites and secure credential handling, then add a small Windows example. Coordinate drain/monitoring actions and application shutdown/startup around patching; include health checks and recovery behavior.

## Stage 5 — ITSM and enterprise controls

Add a mockable REST adapter that checks an approved change before a run and records the result afterward. Add security scanning, protected GitHub environments, audit evidence, and production-target architecture notes. Never claim BMC/Jira/Splunk connectivity until it is implemented and tested.

## Acceptance principles

- No cloud resource is created by a pull-request validation workflow.
- Every mutating action is gated, scoped, logged, and has documented recovery steps.
- Tests can run locally without AWS credentials wherever possible.
- Documentation states prerequisites, limitations, and what is simulated versus real.
