resource "aws_ecr_repository" "container_repo" {
  name = var.repo_name

  encryption_configuration {
    encryption_type = var.encryption_type
    // Key value management(KMS) can be used for custom security
  }
  image_tag_mutability = "MUTABLE"
  image_scanning_configuration {
    scan_on_push = var.image_push_scan
  }

  tags = {
    Name        = var.tag_name
    Environment = var.env_name
  }

}

resource "aws_ecr_registry_policy" "policy" {
  policy = var.policy
}

# aws IAM user id
data "aws_caller_identity" "current" {}

data "aws_region" "current" {}

data "aws_partition" "current" {}
