output "cluster_name" {
  value = module.ecs_cluster.ecs_cluster_name
}

output "service_name" {
  value = module.ecs_service.ecs_service_name
}