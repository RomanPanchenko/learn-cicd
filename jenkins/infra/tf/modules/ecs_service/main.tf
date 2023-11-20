resource "aws_ecs_task_definition" "task" {
  family                   = var.task_family
  network_mode             = var.task_network_mode
  requires_compatibilities = ["EC2"]
  cpu                      = var.task_cpu
  memory                   = var.task_memory

  container_definitions = jsonencode([
    {
      name         = var.container_name
      image        = var.container_image
      cpu          = var.container_cpu
      memory       = var.container_memory
      essential    = true
      portMappings = [
        for port in var.container_ports : {
          containerPort = port
        }
      ],
    },
  ])

  tags = {
    Name = "${var.task_family} task definition (${var.env})"
  }
}

resource "aws_ecs_service" "service" {
  name            = var.ecs_service_name
  cluster         = var.ecs_cluster_id
  task_definition = aws_ecs_task_definition.task.arn
  launch_type     = "EC2"
  desired_count   = var.desired_container_count

  network_configuration {
    subnets         = var.subnet_ids
    security_groups = var.security_groups
  }
}
