locals {
  generated_tags_awscc = [
    {
      "key" : "Name",
      "value" : join("", null_resource.default.*.triggers.id)
    },
    {
      "key" : "Namespace",
      "value" : join("", null_resource.default.*.triggers.namespace),
    },
    {
      "key" : "Account",
      "value" : join("", null_resource.default.*.triggers.account)
    },
    {
      "key" : "Env",
      "value" : join("", null_resource.default.*.triggers.env)
    }
  ]
  generated_tags_aws = { for tag in local.generated_tags_awscc : tag["key"] => tag["value"] }

  tags = try(
    # Tags are already in awscc format
    concat(local.generated_tags_awscc, var.tags),
    # Tags are in aws format. Convert to awscc format
    concat(local.generated_tags_awscc, [for k, v in var.tags : { key : k, value : v }])
  )

  tags_aws = try(
    # Assuming tags are already in aws format
    merge(local.generated_tags_aws, var.tags),
    # Tags are in awscc format. Converting to aws format
    merge(local.generated_tags_aws, { for tag in var.tags : tag["key"] => tag["value"] })
  )
}