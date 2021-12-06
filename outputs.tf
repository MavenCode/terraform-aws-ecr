output "registry_id" {
  # registry ID
  value = aws_ecr_repository.container_repo.registry_id
}

output "repository_url" {
  # repo url
  value = aws_ecr_repository.container_repo.repository_url
}

output "caller_identity" {
  value = data.aws_caller_identity.current.id
}

output "aws_region" {
  value = data.aws_region.current.name
}

output "aws_partition" {
  value = data.aws_partition.current.id
}

output "ecr" {
  value = aws_ecr_repository.container_repo
}
