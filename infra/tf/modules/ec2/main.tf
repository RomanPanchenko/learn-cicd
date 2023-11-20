provider "aws" {
  region = var.region
}

data "aws_availability_zones" "az" {}

data "aws_ami" "latest_instance" {
  owners      = var.aws_ami_owner
  most_recent = true
  filter {
    name   = "name"
    values = var.aws_ami_filter_values
  }
}

resource "aws_default_vpc" "default" {}

resource "aws_instance" "ec2_instance" {
  count             = var.instance_count
  ami               = data.aws_ami.latest_instance.id
  instance_type     = var.instance_type
#  key_name          = var.key_name
  availability_zone = element(data.aws_availability_zones.az.names, count.index % length(data.aws_availability_zones.az.names))
  security_groups   = var.security_groups

  user_data = templatefile("user_data.sh.tpl")

  tags = {
    Name = "${var.instance_name}-${var.env}"
  }
}