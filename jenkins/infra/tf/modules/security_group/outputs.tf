output "aws_security_group_id" {
  value = aws_security_group.sg.id
}

output "aws_security_group_ingress" {
  value = aws_security_group.sg.ingress
}
