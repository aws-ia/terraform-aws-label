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
