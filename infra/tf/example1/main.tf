provider "aws" {
  region = "us-east-2"

#  access_key = "AKIARCHBNSN4II5XL2FS"
#  secret_key = "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"

  default_tags {
    tags = {
      Project = "Learn CI/CD"
      Owner   = "Roman Panchenko"
    }
  }
}


data "aws_availability_zones" "available" {}

data "aws_ami" "latest_aws_linux_2023" {
  owners      = ["137112412989"]
  most_recent = true
  filter {
    name   = "name"
    values = ["al2023-ami-2023.*-x86_64"]
  }
}

#resource "aws_vpc" "main" {
#  cidr_block = var.vpc_cidr
#
#  tags = {
#    Name = "VPC (${var.env})"
#  }
#}

resource "aws_default_vpc" "default" {}

resource "aws_security_group" "author_sg" {
  name        = "author-app-security-group"
  description = "Author App Security Group"
  vpc_id      = aws_default_vpc.default.id

  ingress {
    from_port   = 3001
    to_port     = 3001
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
    Name = "Author App Security Group"
  }
}

resource "aws_security_group" "book_sg" {
  name        = "book-app-security-group"
  description = "Book App Security Group"
  vpc_id      = aws_default_vpc.default.id

  ingress {
    from_port   = 3002
    to_port     = 3002
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
    Name = "Book App Security Group"
  }
}

resource "aws_instance" "author_instance" {
  ami                    = data.aws_ami.latest_aws_linux_2023.id
  instance_type          = var.instance_type
  availability_zone      = data.aws_availability_zones.available.names[0]
  vpc_security_group_ids = [aws_security_group.author_sg.id]

  user_data = templatefile("author_user_data.sh.tpl", {
    docker_image_uri = "Author Docker URI",
  })

  tags = {
    Name = "Author Server ${var.instance_name} (${var.env})"
  }
}

resource "aws_instance" "book_instance" {
  ami                    = data.aws_ami.latest_aws_linux_2023.id
  instance_type          = var.instance_type
  availability_zone      = data.aws_availability_zones.available.names[0]
  vpc_security_group_ids = [aws_security_group.book_sg.id]

  user_data = templatefile("book_user_data.sh.tpl", {
    docker_image_uri = "Book Docker URI",
  })

  tags = {
    Name = "Book Server ${var.instance_name} (${var.env})"
  }
}

#resource "aws_internet_gateway" "main" {
#  vpc_id = aws_vpc.main.id
#
#  tags = {
#    Name = "Internet Gateway (${var.env})"
#  }
#}