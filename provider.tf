terraform {
  required_version = ">= 0.15.0"
  required_providers {
    awscc = {
      source  = "hashicorp/awscc"
      version = ">= 1.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.68"
    }
  }
}
