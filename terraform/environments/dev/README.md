# Development environment

The Terraform root currently defines provider/version and common-tag conventions only. It intentionally contains no resources, so initialization/validation does not require AWS credentials and `terraform plan` has nothing to create. Add infrastructure only in a reviewed follow-up with account authorization, cost controls, and an explicit approval gate.
