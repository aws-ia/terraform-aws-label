variable "region" {
  type        = string
  default     = "eu-west-1"
  description = "What AWS region to deploy resources in."
}

variable "namespace" {
  type        = string
  description = "namespace, which could be your organization name, e.g. amazon"
  default     = "link"
}

variable "env" {
  type        = string
  description = "environment, e.g. 'sit', 'uat', 'prod' etc"
  default     = "sandbox"
}

variable "account" {
  type        = string
  description = "account, which could be AWS Account Name or Number"
  default     = "sandbox001"
}

variable "name" {
  type        = string
  description = "stack name"
  default     = "measurements"
}
