variable "region" {
  type    = string
  default = "us-west-1"
}

variable "namespace" {
  type        = string
  description = "namespace, which could be your organization name, e.g. amazon"
  default     = null
}

variable "env" {
  type        = string
  description = "environment, e.g. 'sit', 'uat', 'prod' etc"
  default     = null
}

variable "account" {
  type        = string
  description = "account, which could be AWS Account Name or Number"
  default     = null
}

variable "name" {
  type        = string
  description = "stack name"
  default     = null
}

variable "delimiter" {
  type        = string
  description = "delimiter, which could be used between name, namespace and env"
  default     = "-"
}

variable "attributes" {
  type        = list(any)
  default     = []
  description = "attributes, which could be used for additional attributes"
}

variable "tags" {
  description = "tags, which could be used for additional tags"
  type        = any
  default     = []
}

variable "id_order" {
  description = "The order in which the `id` is constructed. Default yields `namespace-account-env-name` if your var.delimiter is `-`. Variables that are not populated but order is preserved. Eg: If no `var.namespace` and `var.account` are not specified, yields `env-name`."
  type        = list(any)
  default     = ["namespace", "account", "env", "name"]
  validation {
    condition = anytrue([
      contains(var.id_order, "namespace"),
      contains(var.id_order, "account"),
      contains(var.id_order, "env"),
      contains(var.id_order, "name"),
    ])
    error_message = "Can only contain certain values. See variables.tf."
  }
}
