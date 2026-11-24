#!/usr/bin/env bash
set -euo pipefail

for tool in terraform yamllint ansible-lint; do
  if ! command -v "$tool" >/dev/null 2>&1; then
    printf 'Required tool not found: %s\n' "$tool" >&2
    exit 1
  fi
done

terraform fmt -check -recursive
terraform -chdir=terraform/environments/dev init -backend=false -input=false
terraform -chdir=terraform/environments/dev validate
yamllint .
ansible-lint ansible/playbooks
