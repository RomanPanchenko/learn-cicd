terraform {
  backend "s3" {
    bucket = "${var.remote_state_bucket}"
    key    = "${var.project}/${var.env}/terraform.tfstate"
    region = "${var.remote_state_region}"
  }
}

data "aws_availability_zones" "az" {}

resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "VPC (${var.env})"
  }
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "Internet Gateway (${var.env})"
  }
}