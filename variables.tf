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