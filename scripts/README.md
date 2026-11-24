# Scripts

`validate.sh` runs local static checks and needs Terraform, `yamllint`, and `ansible-lint` installed. Inventory and health-check utilities are future work; the AWS inventory design uses Ansible's `amazon.aws.aws_ec2` plugin rather than hard-coded addresses.
