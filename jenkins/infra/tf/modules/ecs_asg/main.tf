resource "aws_autoscaling_group" "my_asg" {
  desired_capacity     = var.instance_count
  max_size             = var.instance_count
  min_size             = var.instance_count
  vpc_zone_identifier = data.aws_subnet_ids.ids

  launch_template {
    id      = aws_launch_template.my_launch_template.id
    version = "$Latest"
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_launch_template" "my_launch_template" {
  name = "my-launch-template"

  block_device_mappings {
    device_name = "/dev/sda1"
    ebs {
      volume_size = 30
    }
  }

  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = var.security_groups
}

resource "aws_ecs_cluster" "my_cluster" {
  name = "my-ecs-cluster"
}

resource "aws_ecs_instance" "ec2_instances" {
  count = length(var.ec2_instance_ids)

  ami             = data.aws_ami.latest_instance.id
  instance_type   = var.instance_type
  subnet_id       = element(data.aws_subnet_ids.ids, count.index % length(data.aws_subnet_ids.ids))
  security_groups = var.security_groups

  cluster = aws_ecs_cluster.my_cluster.id

  tags = {
    Name = "ECS-Instance-${count.index + 1}"
  }
}
