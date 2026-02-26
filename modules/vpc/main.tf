resource "aws_vpc" "first_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name        = var.vpc_name
    Environment = var.vpc_env
  }
}

resource "aws_subnet" "pub_subnet" {
  vpc_id                  = aws_vpc.first_vpc.id
  cidr_block              = var.pub_sub_cidr
  availability_zone       = var.availability_zone
  map_public_ip_on_launch = true
  tags = {
    Name = var.pub_subnet_name
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.first_vpc.id
  tags = {
    Name = var.igw_name
  }
}

resource "aws_route_table" "routing_table" {
  vpc_id = aws_vpc.first_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = var.routing_table_name
  }
}


resource "aws_route_table_association" "route_table_assoc" {
  subnet_id      = aws_subnet.pub_subnet.id
  route_table_id = aws_route_table.routing_table.id
}


