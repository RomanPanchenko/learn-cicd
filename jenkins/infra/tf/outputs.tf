#output "vpc_id" {
#  value = aws_vpc.main.id
#}
#
#output "vpc_cidr" {
#  value = aws_vpc.main.cidr_block
#}
#
#output "instances" {
#  value = aws_instance.instance.id
#}

output "jenkins_instance_id" {
  value = aws_instance.jenkins_instance.id
}

output "jenkins_instance_public_ip" {
  value = aws_eip.jenkins_eip.public_ip
}
