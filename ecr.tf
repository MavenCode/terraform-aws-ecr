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
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
        "Sid": "ecr_policy",
        "Effect": "Allow",
        "Principal": {"AWS" : "arn:${data.aws_partition.current.partition}:iam::${data.aws_caller_identity.current.account_id}:root"},
        "Resource": [
            "arn:${data.aws_partition.current.partition}:ecr:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:repository/*"
        ],
        "Action": [
            "ecr:DescribeRegistry",
            "ecr:CreateRepository",
            "ecr:ReplicateImage",
            "ecr:StartImageScan",
            "ecr:PutImage",
            "ecr:ListImages",
        ]
    }
  ]  

}
POLICY
}

# aws IAM user id
data "aws_caller_identity" "current" {}

data "aws_region" "current" {}

data "aws_partition" "current" {}
