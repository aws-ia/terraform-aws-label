terraform {
  required_providers {
    test = {
      source = "terraform.io/builtin/test"
    }
  }
}

locals {
  awscc_tags_formatted = {
    test_aws_to_awscc   = tolist(module.aws_labels.tags)
    test_awscc_to_awscc = tolist(module.awscc_labels.tags)
  }
}

resource "test_assertions" "matching_formatted_labels_awscc" {
  component = "tags"

  check "valid_tags_for_awscc" {
    description = "Validate tags formatting for AWSCC Provider usage. expected: {key=\"foo\", value=\"bar\"}"
    condition   = length(setunion(setsubtract(local.awscc_tags_formatted["test_aws_to_awscc"], local.awscc_tags_formatted["test_awscc_to_awscc"]), setsubtract(local.awscc_tags_formatted["test_awscc_to_awscc"], local.awscc_tags_formatted["test_aws_to_awscc"]))) == 0
  }
}

resource "test_assertions" "matching_formatted_labels_aws" {
  component = "tags"

  check "valid_tags_for_aws" {
    description = "Validate tags formatting for AWS Provider usage. expected: {foo = bar}"
    condition   = module.aws_labels.tags_aws == module.awscc_labels.tags_aws
  }
}
resource "test_assertions" "expect_failure" {
  component = "tags"

  check "fail" {
    description = "this test should fail"
    condition   = true == false
  }
  equal "scheme" {
    description = "should fail"
    got         = true
    want        = false 
  }

}
