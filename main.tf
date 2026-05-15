resource "aws_vpc" "main_vpc" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name        = "terraform-course"
    Environment = var.environment
  }
}

# Create subnets
resource "aws_subnet" "public_subnet" {
  # implicit dependency on VPC resource ensures the VPC is created before the subnet
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = var.public_subnet_cidr_block
  availability_zone = var.availability_zone

  tags = {
    Name        = "public-subnet"
    Environment = var.environment
  }
}

resource "aws_subnet" "private_subnet" {
  # implicit dependency on VPC creation
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = var.private_subnet_cidr_block
  availability_zone = var.availability_zone

  tags = {
    Name        = "private-subnet"
    Environment = var.environment
  }
}

# Main Route Table
resource "aws_route_table" "main_route_table" {
  # implicit dependency on VPC creation
  vpc_id = aws_vpc.main_vpc.id

  tags = {
    Name        = "main-route-table"
    Environment = var.environment
  }
}

# Route Table Associations
resource "aws_route_table_association" "public_subnet_associatio" {
  # implicit dependencies on VPC, subnet, and route table creation
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.main_route_table.id
}

resource "aws_route_table_association" "private_subnet_association" {
  # implicit dependencies on VPC, subnet, and route table creation
  subnet_id      = aws_subnet.private_subnet.id
  route_table_id = aws_route_table.main_route_table.id
}

# Example Security Group
resource "aws_security_group" "example_sg" {
  name        = "example-security-group"
  description = "Example security group for testing outputs"
  vpc_id      = aws_vpc.main_vpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "example-security-group"
    Environment = var.environment
  }
}