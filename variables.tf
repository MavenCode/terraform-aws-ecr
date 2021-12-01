variable "repo_name" {
  description = "name for the container image to upload"
  type        = string
  default     = "dev-image"
}

variable "access_key" {
  description = "aws access key"
  type        = string
  default     = "null"
}

variable "secret_key" {
  description = "aws secret key"
  type        = string
  default     = "null"
}

variable "region" {
  description = "aws region"
  type        = string
  default     = "us-west-1"
}

variable "encryption_type" {
  description = "KMS or AES256 registry encryption technique"
  # Key value management(KMS) can be used for custom security
  type    = string
  default = "AES256"
}

variable "image_push_scan" {
  description = "bool val to flag whether images pushed to registry is auto-scanned or manually"
  # Required
  type    = string
  default = true
}

variable "tag_name" {
  description = "tags value for IaC framework"
  type        = string
  default     = "terraform-IaC"
}

variable "env_name" {
  description = "tags value working env: dev, prod or test"
  type        = string
  default     = "dev"
}
