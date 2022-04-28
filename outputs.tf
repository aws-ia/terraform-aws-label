output "tags" {
  description = "Output of tags in awscc provider format."
  value       = local.tags
}

output "tags_aws" {
  description = "Output of tags in aws provider format."
  value       = local.tags_aws
}

output "id" {
  description = "Output of computed id based on inputs to module."
  value       = local.ordered_id
}

output "name" {
  description = "Name of workload."
  value       = local.vars["name"]
}

output "namespace" {
  description = "Namespace of workload."
  value       = local.vars["namespace"]
}

output "account" {
  description = "Account of workload."
  value       = local.vars["account"]
}

output "env" {
  description = "Environment of workload."
  value       = local.vars["env"]
}
