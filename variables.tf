variable "aws_region" {
    description = "AWS region" 
    type        = string 
    default     = "ap-south-2" 
}

variable "project_name" {
    description = "project name prefix for all resources" 
    type        = string 
    default     = "pustaka-chakra"
}

variable "github_org" {
    description = "github organization name" 
    type        = string 
    default     = "pustaka-chakra"
}

variable "github_iac_repo" {
    description = "IAC repo name" 
    type        = string 
    default     = "IAC" 
}

variable "github_backend_repo" {
    description = "backend repo name" 
    type        = string 
    default     = "pustaka-chakra-backend" 
}

variable "ami_id" {
  description = "Ubuntu 24.04 ARM64 AMI ID for ap-south-2"
  type        = string
}
