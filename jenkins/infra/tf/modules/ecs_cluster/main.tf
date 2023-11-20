data "aws_availability_zones" "az" {}

data "aws_ami" "latest_instance" {
  owners      = var.ami_owner
  most_recent = true
  filter {
    name   = "name"
    values = var.ami_filter_values
  }
}

resource "aws_ecs_cluster" "ecs_cluster" {
  name = "${var.ecs_cluster_name} (${var.env})"
}

resource "aws_ecs_instance" "ec2_instance" {
  count           = var.instance_count
  ami             = data.aws_ami.latest_instance.id
  instance_type   = var.instance_type
  key_name        = var.key_name
  subnet_id       = var.subnet_id
  security_groups = var.security_groups

  cluster = aws_ecs_cluster.ecs_cluster.id

  tags = {
    Name = "${var.instance_name} ${count.index + 1}"
  }
}
