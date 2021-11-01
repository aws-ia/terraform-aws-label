locals {
  generated_tags = [
    {
      "key": "Name",
      "value": join("", null_resource.default.*.triggers.id)
    },
    {
      "key": "Namespace",
      "value": join("", null_resource.default.*.triggers.namespace),
    },
    {
      "key": "Account",
      "value": join("", null_resource.default.*.triggers.account)
    },
    {
      "key": "Env",
      "value": join("", null_resource.default.*.triggers.env)
    }
  ]

  tags = concat(local.generated_tags, var.tags)
}