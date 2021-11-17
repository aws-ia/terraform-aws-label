/*
 * Do not use. This This module only exists to verify the tag formatting.
 */

variable "tags" {
  description = "tags, which could be used for additional tags"
}

resource "awscc_iam_role" "role" {
  description = "A temporary role. Should be deleted by the test."

  assume_role_policy_document = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })

  tags = var.tags
}

