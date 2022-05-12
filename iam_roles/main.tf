resource "aws_iam_role" "test_role" {
  name = var.rolename

  
  tags = var.tags
}