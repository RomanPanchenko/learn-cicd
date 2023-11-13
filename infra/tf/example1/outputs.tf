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

output "author_instance_id" {
  value = aws_instance.author_instance.id
}

output "author_instance_public_ip" {
  value = aws_instance.author_instance.public_ip
}

output "book_instance_id" {
  value = aws_instance.book_instance.id
}

output "book_instance_public_ip" {
  value = aws_instance.book_instance.public_ip
}