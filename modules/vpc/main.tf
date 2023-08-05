resource "aws_vpc" "app_vpc" {
  cidr_block           = var.cidr_block
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "NorthStar-VPC"
  }
}

# Public Subnet for Web Tier
resource "aws_subnet" "web_subnet" {
  vpc_id                  = aws_vpc.app_vpc.id
  cidr_block              = var.web_subnet_cidr
  availability_zone       = var.availability_zone_a
  map_public_ip_on_launch = true
  tags = {
    Name = "Web-Subnet"
  }
}

# Private Subnet for App Tier
resource "aws_subnet" "app_subnet" {
  vpc_id     = aws_vpc.app_vpc.id
  cidr_block = var.app_subnet_cidr
  availability_zone = var.availability_zone_b
  tags = {
    Name = "App-Subnet"
  }
}

# Private Subnet for Data Tier
resource "aws_subnet" "data_subnet" {
  vpc_id     = aws_vpc.app_vpc.id
  cidr_block = var.data_subnet_cidr
  availability_zone = var.availability_zone_a
  tags = {
    Name = "Data-Subnet"
  }
}

# Internet Gateway for Public Access
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.app_vpc.id
  tags = {
    Name = "NorthStar-IGW"
  }
}

# Route Table for Public Subnet
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.app_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "Public-Route-Table"
  }
}

# Associate Public Route Table with Web Subnet
resource "aws_route_table_association" "public_route_table_association" {
  subnet_id      = aws_subnet.web_subnet.id
  route_table_id = aws_route_table.public_route_table.id
}

# Additional resources as needed, such as NAT Gateways, Security Groups, etc.
