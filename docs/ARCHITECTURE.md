# Architecture

## Purpose

This repository is a portfolio-scale reference for a future AWS-hosted automation platform. The current commit is documentation and safe scaffolding only: it does not provision infrastructure, connect to AWS, patch hosts, or call enterprise services.

## Target flow

1. Engineers propose changes through a GitHub pull request.
2. GitHub Actions checks formatting and automation syntax. A future deployment workflow will require environment approval and short-lived AWS identity before making changes.
3. Terraform will provision private network segments, security groups, IAM roles, managed EC2 targets, SSM connectivity, logging, and secret references.
4. Ansible will discover targets from AWS tags, then run controlled Linux or Windows patch workflows with prechecks, application lifecycle coordination, reboot handling, post-validation, and evidence capture.
5. A future adapter may validate a change ticket before execution and publish results to ITSM/observability systems.

## Target AWS boundaries

- Private subnets only for managed targets; no public SSH/RDP ingress in the intended design.
- Systems Manager Session Manager/Run Command is preferred over inbound administration ports.
- Separate IAM roles for automation and managed instances, scoped to required actions and resources.
- CloudWatch log/evidence retention and Secrets Manager references are planned; credentials must not be stored in Git.
- Environment and workload tags drive inventory and patch waves (`Environment`, `OS`, `PatchGroup`, `Application`).

## Enterprise direction

An enterprise deployment could use Red Hat Ansible Automation Platform Controller for RBAC, job templates, inventories, credentials, and workflow approvals; Private Automation Hub for curated content; and Automation Mesh for distributed execution. The portfolio will keep the examples compatible with Ansible Core where practical and clearly distinguish implemented functionality from target integrations.
