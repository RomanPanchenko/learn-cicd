provider "aws" {
  region = "us-east-2"

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

  dynamic "ingress" {
    for_each = toset(["22", "8080"])

    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Jenkins Security Group"
  }
}

resource "aws_instance" "jenkins_instance" {
  ami                    = data.aws_ami.latest_aws_linux_2023.id
  instance_type          = var.instance_type
  availability_zone      = data.aws_availability_zones.available.names[0]
  vpc_security_group_ids = [aws_security_group.jenkins_sg.id]

  user_data = templatefile("user_data.sh.tpl", {
    docker_image_uri = "Jenkins Docker URI",
  })

  tags = {
    Name = "Jenkins Server ${var.instance_name}-${var.env}"
  }
}

resource "aws_eip" "jenkins_eip" {
  instance = aws_instance.jenkins_instance.id
}

resource "aws_eip_association" "jenkins_eip_assoc" {
  instance_id   = aws_instance.jenkins_instance.id
  allocation_id = aws_eip.jenkins_eip.id
}

data "aws_route53_zone" "rpanchenko123_com" {
  name = "rpanchenko123.com"
}

resource "aws_route53_record" "jenkins_route53_record" {
  name    = "jenkins.rpanchenko123.com"
  type    = "A"
  zone_id = data.aws_route53_zone.rpanchenko123_com.id
  records = [aws_eip.jenkins_eip.public_ip]
  ttl     = "300"
}