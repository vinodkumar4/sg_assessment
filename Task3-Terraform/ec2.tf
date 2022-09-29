resource "aws_instance" "web_ubuntu" {
  ami                    = var.ami_id_ubuntu
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.internet_access_sg.id]
  subnet_id = aws_subnet.public_subnet.id
  key_name = "pc_vvk"
  user_data              = file("user-data-apache.sh")
  tags = {
    Name = "web_ubuntu"
  }
}

resource "aws_instance" "web_centos" {
  ami                    = var.ami_id_centos
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.within_vpc_cidr.id]
  subnet_id = aws_subnet.private_subnet.id
  key_name = "pc_vvk"
  tags = {
    Name = "web_centos"
  }
}

resource "aws_security_group" "within_vpc_cidr" {
  name        = "allow_for_centos_within_vpc"
  description = "Allow inbound and outbound inside VPC only"
  vpc_id      = aws_vpc.my_vpc.id

  ingress {
    description = "TLS from VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.my_vpc.cidr_block]
    # Task 3: Step 7, enable below line and disable cidr_blocks above
    # security_groups = [aws_security_group.internet_access_sg.id]
  }

  egress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.my_vpc.cidr_block]
    # Task 3: Step 7, enable below line and disable cidr_blocks above
    # security_groups = [aws_security_group.internet_access_sg.id]
  }

  ingress {
    description = "TLS from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.my_vpc.cidr_block]
    # Task 3: Step 7, enable below line and disable cidr_blocks above
    # security_groups = [aws_security_group.internet_access_sg.id]
  }

  egress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.my_vpc.cidr_block]
    # Task 3: Step 7, enable below line and disable cidr_blocks above
    # security_groups = [aws_security_group.internet_access_sg.id]
  }

  ingress {
    description = "TLS from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.my_vpc.cidr_block]
    # Task 3: Step 7, enable below line and disable cidr_blocks above
    # security_groups = [aws_security_group.internet_access_sg.id]
  }

  egress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.my_vpc.cidr_block]
    # Task 3: Step 7, enable below line and disable cidr_blocks above
    # security_groups = [aws_security_group.internet_access_sg.id]
  }
  tags = {
    Name = "allow_tls_on_centos"
  }
}



resource "aws_security_group" "internet_access_sg" {
  name        = "allow_for_centos"
  description = "Allow inbound and outbound inside VPC only"
  vpc_id      = aws_vpc.my_vpc.id

  ingress {
    description = "TLS from VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "TLS from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "TLS from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["122.161.84.235/32"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "internet_access_sg"
  }
}