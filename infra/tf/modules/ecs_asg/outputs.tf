output "aws_launch_template_id" {
  value = aws_launch_template.launch_template.id
}

output "aws_autoscaling_group_id" {
  value = aws_autoscaling_group.asg.id
}

output "aws_ami_latest_instance_id" {
  value = data.aws_ami.latest_instance.id
}

#output "aws_ecs_instance_ids" {
#  value = aws_ecs_instance.ec2_instances[*].id
#}