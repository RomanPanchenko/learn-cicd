provider "aws" {
  region = var.region
}

resource "aws_launch_template" "launch_template" {
  name                   = var.launch_template_name
  instance_type          = var.instance_type
  vpc_security_group_ids = var.security_groups
  image_id               = data.aws_ami.latest_instance.id
  user_data              = base64encode(file("./modules/ecs_asg/user_data.sh"))
}

resource "aws_autoscaling_group" "asg" {
  name                = var.auto_scaling_group_name
  force_delete        = true
  desired_capacity    = var.desired_instance_count
  max_size            = var.max_instance_count
  min_size            = var.min_instance_count
  vpc_zone_identifier = var.subnet_ids
  health_check_type   = "EC2"

  launch_template {
    id      = aws_launch_template.launch_template.id
    version = "$Latest"
  }

  lifecycle {
    create_before_destroy = true
  }
}

data "aws_ami" "latest_instance" {
  owners      = [var.ami_owner]
  most_recent = true
  filter {
    name   = "name"
    values = var.ami_filter_values
  }
}

#resource "aws_instance" "ec2_instances" {
#  count           = var.desired_instance_count
#  ami             = data.aws_ami.latest_instance.id
#  instance_type   = var.instance_type
#  subnet_id       = element(var.subnet_ids, count.index % length(var.subnet_ids))
#  security_groups = var.security_groups
#
#  tags = {
#    Name = "${var.instance_name}-${count.index + 1}-${var.env}"
#  }
#}
