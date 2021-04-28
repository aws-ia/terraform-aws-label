provider "aws" {
  region = "var.region"
}

resource "null_resource" "default" {
  triggers = {
    id         = lower(join(var.delimiter, compact(concat(list(var.namespace, var.account, var.env, var.name), var.attributes))))
    name       = lower(format("%v", var.name))
    namespace  = lower(format("%v", var.namespace))
    account    = lower(format("%v", var.account))
    env        = lower(format("%v", var.env))
    attributes = lower(format("%v", join(var.env, compact(var.attributes))))
  }
  lifecycle {
    create_before_destroy = true
  }
}
