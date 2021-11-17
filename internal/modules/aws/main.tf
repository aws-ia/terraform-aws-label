/*
 * Do not use. This This module only exists to verify the tag formatting.
 */

variable "tags" {
  description = "tags, which could be used for additional tags"
  type        = map(string)
}

resource "aws_iam_policy" "policy" {
  description = "A temporary policy. Should be deleted by the test."
  name_prefix = "test_policy"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ec2:Describe*",
        ]
        Effect   = "Deny"
        Resource = "*"
      },
    ]
  })

  tags = var.tags
}

