provider "aws" {
  region = var.region
}

resource "aws_ecs_cluster" "ecs_cluster" {
  name = var.ecs_cluster_name

  tags = {
    Name = "${var.ecs_cluster_name} (${var.env})"
  }
}
