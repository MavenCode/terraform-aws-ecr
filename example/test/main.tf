module "ecr_registry" {
  source = "https://github.com/MavenCode/terraform-aws-ecr"
  repo_name       = var.repo_name_test
  acess_key       = var.access_key
  secret_key      = var.secret_key
  region          = var.region
  policy          = var.policy
  encryption_type = var.encryption_type
  image_push_scan = var.scan_on_push

  tag_name = var.tag
  env_name = var.env

}

variable "repo_name_test" { type = string }
variable "access_key" { type = string }
variable "secret_key" { type = string }
variable "region" { type = string }
variable "encryption_type" { type = string }
variable "scan_on_push" { type = bool }

variable "tag" { type = string }
variable "env" { type = string }
