data "aws_subnet_ids" "subnets" {
  vpc_id = var.vpc_id
}

resource "aws_launch_template" "launch_template" {
  name                   = var.launch_template_name
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = var.security_groups
}

resource "aws_autoscaling_group" "asg" {
  desired_capacity    = var.desired_instance_count
  max_size            = var.max_instance_count
  min_size            = var.min_instance_count
  vpc_zone_identifier = data.aws_subnet_ids.subnets.ids

  launch_template {
    id      = aws_launch_template.launch_template.id
    version = "$Latest"
    name = "${var.asg_launch_template_name} (${var.env})"
  }

  lifecycle {
    create_before_destroy = true
  }
}

data "aws_ami" "latest_instance" {
  owners      = var.aws_ami_owner
  most_recent = true
  filter {
    name   = "name"
    values = var.aws_ami_filter_values
  }
}

resource "aws_ecs_instance" "ec2_instances" {
  count           = var.desired_instance_count
  ami             = data.aws_ami.latest_instance.id
  instance_type   = var.instance_type
  subnet_id       = element(data.aws_subnet_ids.subnets.ids, count.index % length(data.aws_subnet_ids.subnets.ids))
  security_groups = var.security_groups
  cluster         = var.ecs_cluster_id

  tags = {
    Name = "${var.instance_name}-${count.index + 1} (${var.env})"
  }
}
