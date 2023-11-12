terraform {
  backend "s3" {
    bucket = "${var.remote_state_bucket}"
    key    = "${var.project}/${var.env}/terraform.tfstate"
    region = "${var.remote_state_region}"
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

resource "aws_instance" "instance" {
  count             = length(data.aws_availability_zones.available.names)
  ami               = data.aws_ami.latest_aws_linux_2023.id
  instance_type     = var.instance_type
  availability_zone = data.aws_availability_zones.available.names[count.index]

  tags = {
    Name = "${var.instance_name} ${count.index + 1} (${var.env})"
  }
}
