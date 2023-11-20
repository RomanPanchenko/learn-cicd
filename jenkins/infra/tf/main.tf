provider "aws" {
  region = "us-east-2"

  default_tags {
    tags = {
      Project = "Learn CI/CD"
      Owner   = "Roman Panchenko"
    }
  }
}

locals {
  env = "development"
}

data "aws_availability_zones" "available" {}

module "vpc" {
  source   = "./modules/vpc"
  env      = local.env
  vpc_cidr = "10.0.0.0/16"
  vpc_name = "My VPC"
}

module "subnet" {
  source      = "./modules/subnet"
  env         = local.env
  vpc_id      = module.vpc.vpc_id
  subnet_name = "My Private Subnet"
  subnet_cidr = "10.0.1.0/24"
  subnet_az   = data.aws_availability_zones.available.names[0]
}

module "security_group" {
  source                     = "./modules/security_group"
  env                        = local.env
  security_group_name        = "WebServer Security Group"
  security_group_description = "SSH, HTTP, HTTPS"
  vpc_id                     = module.vpc.vpc_id
  ingress_ports              = ["22", "80", "443"]
}

module "ecs_cluster" {
  source           = "./modules/ecs_cluster"
  env              = local.env
  ecs_cluster_name = "My ECS Cluster"
}

module "ecs_asg" {
  source          = "./modules/ecs_asg"
  env             = local.env
  ecs_cluster_id  = module.ecs_cluster.ecs_cluster_id
  vpc_id          = module.vpc.vpc_id
  security_groups = [module.security_group.aws_security_group_id]
}

module "ecs_service" {
  source          = "./modules/ecs_service"
  env             = local.env
  task_family     = "author-app"
  container_name  = "author-app"
  container_image = "073487192952.dkr.ecr.us-east-2.amazonaws.com/author_repo:75039650-0f8768fc4ff9"
  ecs_cluster_id  = module.ecs_cluster.ecs_cluster_id
  container_ports = ["80"]
  security_groups = [module.security_group.aws_security_group_id]
  subnet_ids      = [module.subnet.subnet_id]
}