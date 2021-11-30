terraform {
  required_providers {
    test = {
      source = "terraform.io/builtin/test"
    }
  }
}

resource "test_assertions" "labels_tags" {
  component = "tags"

  equal "scheme" {
    description = "default scheme is https"
    got         = module.labels.tags_aws["Account"]
    want        = "sandbox001"
  }
}
