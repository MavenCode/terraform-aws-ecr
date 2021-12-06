variable "repo_name" {
  description = "name for the container image to upload"
  default     = "dev-image"
}

variable "region" {
  description = "aws region"
  default     = "us-west-1"
}

variable "encryption_type" {
  description = "KMS or AES256 registry encryption technique"
  # Key value management(KMS) can be used for custom security
  default = "AES256"
}

variable "image_push_scan" {
  description = "bool val to flag whether images pushed to registry is auto-scanned or manually"
  # Required
  default = true
}

variable "tag_name" {
  description = "tags value for IaC framework"
  default     = "terraform-IaC"
}

variable "env_name" {
  description = "tags value working env: dev, prod or test"
  default     = "dev"
}
