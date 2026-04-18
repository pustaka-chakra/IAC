output "vpc_id" { 
    description = "VPC id" 
    value = aws_vpc.main.id
}

output "public_subnet_id" { 
    description = "public subnet ID" 
    value = aws_subnet.public.id 
}
