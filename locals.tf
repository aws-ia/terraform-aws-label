# resource "null_resource" "default" {
#   triggers = local.non_empty_vars_map

#   lifecycle {
#     create_before_destroy = true
#   }
# }

locals {
  order = ["namespace", "account", "env", "name"]
  vars = {
    name      = var.name
    namespace = var.namespace
    env       = var.env
    account   = var.account
  }
  non_empty_vars     = [for k, v in local.vars : k if v != null]
  non_empty_vars_map = { for k in local.non_empty_vars : k => local.vars[k] }

  # using the order from var.id_order, create the delmitied id from vars that are actually passed
  ordered_id = join(var.delimiter, compact(concat([for k in var.id_order : contains(local.non_empty_vars, k) ? lookup(local.vars, k) : null], var.attributes)))
  generated_tags_awscc = [
    for k, v in local.non_empty_vars_map :
    {
      key : k,
      value : v
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
