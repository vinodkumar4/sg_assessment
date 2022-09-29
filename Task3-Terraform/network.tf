resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = "true"
  tags = {
    Name = "my_custom_vpc"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  tags = {
    Name = "public_subnet"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "10.0.2.0/24"
  tags = {
    Name = "private_subnet"
  }
}

resource "aws_internet_gateway" "example" {
  vpc_id = aws_vpc.my_vpc.id
}

resource "aws_egress_only_internet_gateway" "example" {
  vpc_id = aws_vpc.my_vpc.id
}

resource "aws_route_table" "public_route" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.example.id
  }

  tags = {
    Name = "public_route"
  }
}

resource "aws_route_table" "private_route" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "private_route"
  }
}

resource "aws_route_table_association" "private_routes" {
  subnet_id      = aws_subnet.private_subnet.id
  route_table_id = aws_route_table.private_route.id
}

resource "aws_route_table_association" "public_routes" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_route.id
}

