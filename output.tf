
output "tags" {
  value = local.tags
}

output "id" {
  value = join("", null_resource.default.*.triggers.id)
}

output "name" {
  value = join("", null_resource.default.*.triggers.name)
}

output "namespace" {
  value = join("", null_resource.default.*.triggers.namespace)
}

output "account" {
  value = join("", null_resource.default.*.triggers.account)
}

output "env" {
  value = join("", null_resource.default.*.triggers.env)
}

output "attributes" {
  value = join("", null_resource.default.*.triggers.attributes)
}
