output "vpc_id" {
  value = aws_vpc.main_vpc.id
}

output "vpc_cidr" {
  value = aws_vpc.main_vpc.cidr_block
}

output "public_subnet_cidr_block" {
  value = aws_subnet.public_subnet.cidr_block
}

output "public_subnet_az" {
  value = aws_subnet.public_subnet.availability_zone
}

output "private_subnet_az" {
  value = aws_subnet.private_subnet.availability_zone
}