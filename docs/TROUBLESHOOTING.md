# Troubleshooting Guide

These entries are diagnostic prompts for future implementation; they do not imply that AWS connectivity or patch automation is currently configured.

| Symptom | Checks |
|---|---|
| Terraform AWS provider cannot authenticate | Confirm an authorized short-lived identity and selected account/region; never paste credentials into logs or files. |
| Terraform cannot reach a target | Check subnet routes, endpoint/NAT design, security-group scope, DNS, and Systems Manager agent/instance role. |
| Dynamic inventory returns no hosts | Confirm the AWS collection is installed, credentials/region are correct, and instance tags match the inventory filters. |
| SSH authentication fails | Prefer SSM in the intended design; otherwise verify approved key/username and narrowly scoped network path. |
| WinRM connection fails | Check listener, firewall, TLS/certificate, DNS, time sync, and WinRM authentication policy. Avoid weakening authentication to make a test pass. |
| Windows delegated task fails (double-hop) | Review the required credential delegation model and use an approved secure method; do not log passwords or enable broad delegation. |
| Patch times out or reboot does not return | Check package/update service, maintenance window, host health, management agent, and console evidence; stop the wave and escalate. |
| Service does not start after patch | Preserve logs, validate dependencies and configuration, keep traffic drained, and follow the service owner's recovery plan. |
| ITSM adapter returns 401/403 | Verify endpoint, token scope/expiry, and secret reference with the service owner; never print token contents. |
| Fleet run partially fails | Separate host-level results, stop expansion to later waves, report accurate impact, and follow the approved recovery decision. |
