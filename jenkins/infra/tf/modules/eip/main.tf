resource "aws_eip" "ec2_instance_eip" {
  count    = length(var.ec2_instance_ids)
  instance = element(var.ec2_instance_ids, count.index)
}

resource "aws_eip_association" "ec2_instance_eip_association" {
  count         = length(var.ec2_instance_ids)
  instance_id   = var.ec2_instance_ids[count.index]
  allocation_id = aws_eip.ec2_instance_eip[count.index].id
}
