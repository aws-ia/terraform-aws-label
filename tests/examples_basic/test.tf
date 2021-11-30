terraform {
  required_providers {
    test = {
      source = "terraform.io/builtin/test"
    }
  }
}

resource "test_assertions" "tags" {
  component = "tags"

  equal "account_name" {
    description = "Validate account name tag is as expected"
    got         = module.labels.tags_aws["Account"]
    want        = "sandbox001"
  }
}
