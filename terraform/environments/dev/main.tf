terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

variable "aws_region" {
  description = "AWS region reserved for a future development environment."
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Project identifier applied to future resources."
  type        = string
  default     = "automation-platform-lab"
}

provider "aws" {
  region = var.aws_region
}

locals {
  common_tags = {
    Project     = var.project_name
    Environment = "dev"
    ManagedBy   = "terraform"
  }
}

# Intentionally no resources: this starter can be initialized and validated
# without AWS credentials and cannot create cloud infrastructure.
