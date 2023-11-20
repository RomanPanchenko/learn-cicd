provider "aws" {
  region = var.region
}

resource "aws_subnet" "subnet" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.subnet_cidr
  availability_zone       = var.subnet_az
  map_public_ip_on_launch = false
  tags                    = {
    Name = "${var.subnet_name} (${var.env})"
  }
}