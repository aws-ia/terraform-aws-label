output "tags" {
  description = "output of tags in awscc provider format."
  value       = local.tags
}

output "tags_aws" {
  description = "output of tags in aws provider format."
  value       = local.tags_aws
}

output "id" {
  description = "output of computed id based on inputs to module."
  value       = local.ordered_id
}

output "name" {
  description = "name of workload."
  value       = local.vars["name"]
}

output "namespace" {
  description = "namespace of workload."
  value       = local.vars["namespace"]
}

output "account" {
  description = "account of workload."
  value       = local.vars["account"]
}

output "env" {
  description = "environment of workload."
  value       = local.vars["env"]
}
