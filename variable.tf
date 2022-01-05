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
  type    = list(any)
  default = ["namespace", "account", "env", "name"]

}
