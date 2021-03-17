variable "region" {
	default = "us-west-1"
}
variable "namespace" {
  description = "namespace, which could be your organiation name, e.g. amazon"
  default = "test"
}
variable "env" {
  description = "environment, e.g. 'sit', 'uat', 'prod' etc"
  default = "test"
}
variable "account" {
  description = "account, which could be AWS Account Name or Number"
  default = "test"
}
variable "name" {
  description = "stack name"
  default = "test"
}
variable "delimiter" {
  description = "delimiter, which could be used between name, namespace and env"
  default = "-"
}
variable "attributes" {
  #type        = list(string)
  default     = []
  description = "atttributes, which could be used for additional attributes"
}

variable "tags" {
  #type        = map(string)
  default     = {}
  description = "tags, which could be used for additional tags"
}

