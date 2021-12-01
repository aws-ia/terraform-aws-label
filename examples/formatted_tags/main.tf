##########################################
# Note: this file is symlinked into /tests
# This example shows that regardless of the input format
# you can pass properly formatted tags from the module
##########################################

provider "aws" {
  region = var.region
}

provider "awscc" {
  region = var.region
}

locals {
  # In the AWS provider format
  aws_tags = {
    "service" : "measurements",
    "managed_by" : "terraform"
  }

  # In the AWSCC provider format
  awcc_tags = [
    { "key" : "service", "value" : "measurements" },
    { "key" = "managed_by", "value" : "terraform" }
  ]
}

# Using aws provider format as input
module "aws_labels" {
  source = "../.."

  tags = local.aws_tags
}

# Using awscc provider format as input
module "awscc_labels" {
  source = "../.."

  tags = local.awcc_tags
}

# awscc provider resources created with tags

resource "awscc_ec2_vpc" "test_aws_to_awscc" {
  cidr_block = "10.0.0.0/16"
  tags = module.aws_labels.tags
}

resource "awscc_ec2_vpc" "test_awscc_to_awscc" {
  cidr_block = "10.0.0.0/16"
  tags = module.awscc_labels.tags
}

# aws provider resources created with tags

resource "aws_vpc" "test_aws_to_aws" {
  cidr_block = "10.0.0.0/16"
  tags = module.aws_labels.tags_aws
}

resource "aws_vpc" "test_awscc_to_aws" {
  cidr_block = "10.0.0.0/16"
  tags = module.awscc_labels.tags_aws
}
