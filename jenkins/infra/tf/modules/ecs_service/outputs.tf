output "task_definition_arn" {
  value = aws_ecs_task_definition.task.arn
}

output "ecs_service_id" {
  value = aws_ecs_service.service.id
}

output "ecs_service_name" {
  value = aws_ecs_service.service.name
}