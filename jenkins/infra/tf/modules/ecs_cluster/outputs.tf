output "ecs_cluster_id" {
  value = aws_ecs_cluster.ecs_cluster.id
}

output "ecs_cluster_instance_ids" {
  value = aws_ecs_instance.ec2_instance[*].id
}