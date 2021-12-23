resource "aws_ecr_repository" "container_repo" {
  name = "${var.repo_name}-${random_uuid.contname_suffix_id.result}"

  encryption_configuration {
    encryption_type = var.encryption_type
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
  policy = data.template_file.ecr_policy_vars.rendered
}

# generate uuid appended to entered or default repo name for uniqueness
resource "random_uuid" "contname_suffix_id" {}

# policy separation and template implementation
data "template_file" "ecr_policy_vars" {
  template = "${file("${path.module}/${var.policy}")}"

  vars = {
    current_partition = "${data.aws_partition.current.partition}"
    caller_identity = "${data.aws_caller_identity.current.account_id}"
    aws_region = "${data.aws_region.current.name}"
    
  }
}

# aws IAM user id
data "aws_caller_identity" "current" {}

data "aws_region" "current" {}

data "aws_partition" "current" {}