resource "aws_iam_policy" "policy" {
  name        = var.policyname
  path        = "/"
  description = var.policydescription

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode(var.policystring)
}