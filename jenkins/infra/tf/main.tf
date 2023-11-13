provider "aws" {
  region = "us-east-1"

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

resource "aws_default_vpc" "default" {}

resource "aws_security_group" "jenkins_sg" {
  name        = "jenkins-security-group"
  description = "Jenkins Security Group"
  vpc_id      = aws_default_vpc.default.id

  ingress {
    from_port   = 0
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "jenkins_instance" {
  ami                    = data.aws_ami.latest_aws_linux_2023.id
  instance_type          = var.instance_type
  availability_zone      = data.aws_availability_zones.available.names[0]
  vpc_security_group_ids = [aws_security_group.jenkins_sg.id]

  user_data = templatefile("jenkins_user_data.sh.tpl", {
    docker_image_uri = "Jenkins Docker URI",
  })

  tags = {
    Name = "Jenkins Server ${var.instance_name} (${var.env})"
  }
}
