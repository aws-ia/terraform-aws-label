output "tags" {
  value = local.tags
}

output "tags_aws" {
  value = local.tags_aws
}

output "id" {
  value = local.ordered_id
}

output "name" {
  value = local.vars["name"]
}

output "namespace" {
  value = local.vars["namespace"]
}

output "account" {
  value = local.vars["account"]
}

output "env" {
  value = local.vars["env"]
}
