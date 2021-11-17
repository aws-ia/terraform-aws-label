provider "aws" {
  region = var.region
}

provider "awscc" {
  region = var.region
}

locals {
  # In the AWS provider format
  aws_tags = {
    "service" : "authorize",
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

module "test_aws_to_aws" {
  source = "../../internal/modules/aws"

  tags = module.aws_labels.tags_aws
}

module "test_aws_to_awscc" {
  source = "../../internal/modules/awscc"

  tags = module.aws_labels.tags
}

module "test_awscc_to_aws" {
  source = "../../internal/modules/aws"

  tags = module.awscc_labels.tags_aws
}

module "test_awscc_to_awscc" {
  source = "../../internal/modules/awscc"

  tags = module.awscc_labels.tags
}
