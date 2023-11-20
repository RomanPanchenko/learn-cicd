output "eip_ips" {
  value = aws_eip.ec2_instance_eip[*].public_ip
}