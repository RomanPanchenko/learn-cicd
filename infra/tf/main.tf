provider "aws" {
  region = var.region

  default_tags {
    tags = {
      Project = "Learn CI/CD"
      Owner   = "Roman Panchenko"
    }
  }
}

data "aws_availability_zones" "available" {}

module "vpc" {
  source   = "./modules/vpc"
  region   = var.region
  env      = var.env
  vpc_cidr = var.vpc_cidr
  vpc_name = var.vpc_name
}

module "subnet" {
  source      = "./modules/subnet"
  region      = var.region
  env         = var.env
  vpc_id      = module.vpc.vpc_id
  subnet_name = var.subnet_name
  subnet_cidr = var.subnet_cidr
  subnet_az   = data.aws_availability_zones.available.names[0]
}

module "security_group" {
  source                     = "./modules/security_group"
  region                     = var.region
  env                        = var.env
  security_group_name        = var.security_group_name
  security_group_description = var.security_group_description
  vpc_id                     = module.vpc.vpc_id
  ingress_ports              = var.security_group_ingress_ports
}

module "ecs_cluster" {
  source           = "./modules/ecs_cluster"
  region           = var.region
  env              = var.env
  ecs_cluster_name = var.ecs_cluster_name
}

module "ecs_asg" {
  source                  = "./modules/ecs_asg"
  region                  = var.region
  env                     = var.env
  ecs_cluster_id          = module.ecs_cluster.ecs_cluster_id
  vpc_id                  = module.vpc.vpc_id
  subnet_ids              = [module.subnet.subnet_id]
  security_groups         = [module.security_group.aws_security_group_id]
  instance_type           = var.instance_type
  instance_name           = var.instance_name
  launch_template_name    = var.launch_template_name
  min_instance_count      = var.min_instance_count
  desired_instance_count  = var.desired_instance_count
  max_instance_count      = var.max_instance_count
  auto_scaling_group_name = var.auto_scaling_group_name
}

module "ecs_service" {
  source                  = "./modules/ecs_service"
  region                  = var.region
  env                     = var.env
  ecs_service_name        = var.ecs_service_name
  task_cpu                = var.task_cpu
  task_memory             = var.task_memory
  task_network_mode       = var.task_network_mode
  task_family             = var.task_family
  container_name          = var.task_family
  container_image         = var.container_image
  desired_container_count = var.desired_container_count
  container_cpu           = var.container_cpu
  container_memory        = var.container_memory
  ecs_cluster_id          = module.ecs_cluster.ecs_cluster_id
  container_ports         = var.container_ports
  security_groups         = [module.security_group.aws_security_group_id]
  subnet_ids              = [module.subnet.subnet_id]
}