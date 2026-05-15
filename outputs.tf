output "vpc_id" {
  description = "The ID of the created VPC."
  value       = aws_vpc.main_vpc.id
}

output "vpc_arn" {
  description = "The ARN of the created VPC."
  value       = aws_vpc.main_vpc.arn
}

output "vpc_cidr_block" {
  description = "The CIDR block of the created VPC."
  value       = aws_vpc.main_vpc.cidr_block
}

output "public_subnet_id" {
  description = "The ID of the created public subnet."
  value       = aws_subnet.public_subnet.id
}

output "private_subnet_id" {
  description = "The ID of the created private subnet."
  value       = aws_subnet.private_subnet.id
}

output "route_table_id" {
  description = "The ID of the created route table."
  value       = aws_route_table.main_route_table.id
}

output "security_group_id" {
  description = "The ID of the created security group."
  value       = aws_security_group.example_sg.id
}