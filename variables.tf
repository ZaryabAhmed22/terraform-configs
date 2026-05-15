variable "aws_region" {
  description = "The AWS region to deploy resources in."
  type        = string
  default     = "us-east-1"
}

variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC."
  type        = string
  default     = "192.168.0.0/16"
}

variable "environment" {
  description = "The environment name for tagging"
  type        = string
  default     = "learning-terraform"
}

variable "public_subnet_cidr_block" {
  description = "CIDR block for the public subnets."
  type        = string
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr_block" {
  description = "CIDR block for the private subnets."
  type        = string
  default     = "10.0.2.0/24"
}

variable "availability_zone" {
  description = "The availability zone to deploy resources in."
  type        = string
  default     = "us-east-1a"
}

