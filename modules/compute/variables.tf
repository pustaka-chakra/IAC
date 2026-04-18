variable "project_name" {
  description = "Project name prefix"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID from networking module"
  type        = string
}

variable "subnet_id" {
  description = "Public subnet ID from networking module"
  type        = string
}

variable "ec2_instance_profile_name" {
  description = "IAM instance profile from IAM module"
  type        = string
}

variable "ami_id" {
  description = "Ubuntu 24.04 ARM64 AMI ID for ap-south-2"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t4g.micro"
}

variable "ebs_volume_size" {
  description = "EBS volume size in GB"
  type        = number
  default     = 20
}
