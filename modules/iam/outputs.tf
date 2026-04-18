output "ec2_instance_profile_name" {
  description = "EC2 instance profile name to attach to EC2"
  value       = aws_iam_instance_profile.ec2_profile.name
}

output "github_actions_role_arn" {
  description = "GitHub Actions OIDC role ARN"
  value       = aws_iam_role.github_actions_role.arn
}
