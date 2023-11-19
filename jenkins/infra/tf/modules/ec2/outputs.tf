output "instance_ids" {
  value = aws_instance.ec2_instance[*].id
}

output "latest_instance_ami_id" {
  value = data.aws_ami.latest_instance.id
}

output "availability_zones" {
  value = data.aws_availability_zones.az.names
}