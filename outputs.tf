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