variable "project_name" {
    description = "project name prefix" 
    type = string 
}

variable "vpc_cidr" {
    description = "CIDR block for VPC" 
    type = string 
    default = "10.0.0.0/16" 
}

variable "public_subnet_cidr" {
    description = "CIDR block for public subnet" 
    type = string 
    default = "10.0.1.0/24" 
}

variable "availability_zone" {
    description = "AZ for the public subnet - single" 
    type = string 
    default = "ap-south-2a" 
}