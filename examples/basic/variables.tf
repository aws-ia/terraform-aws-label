##########################################
# Note: this file is symlinked into /tests
##########################################

variable "region" {
  type        = string
  default     = "eu-west-1"
  description = "What AWS region to deploy resources in."
}
