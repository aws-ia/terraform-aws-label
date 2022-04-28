terraform {
  required_providers {
    awscc = {
      source  = "hashicorp/awscc"
      version = "~> 0.9"
    }
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.68"
    }
  }
}

provider "awscc" {
  user_agent = [{
    product_name    = "terraform-awscc-label"
    product_version = "0.0.4"
    comment         = "V1/AWS-D69B4015/376222271"
  }]
}
