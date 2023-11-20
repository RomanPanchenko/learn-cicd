variable "region" {
  type = string
}

variable "launch_template_name" {
  type = string
  #  default = "ECS Launch Template"
}

variable "ami_owner" {
  type    = string
  default = "137112412989"
  #  default = "679593333241"
}

variable "ami_filter_values" {
  type    = list(string)
  default = ["al2023-ami-2023.*-x86_64"]
  #  default = ["Amazon ECS-Optimized Amazon Linux 2 AMI with Support by Terracloudx *"]
}

variable "instance_type" {
  type = string
  #  default = "t3.micro"
}

variable "instance_name" {
  type = string
  #  default = "Server"
}

variable "security_groups" {
  type = list(string)
}

#variable "key_name" {
#  type = string
#}

variable "ecs_cluster_id" {
  type = string
}

variable "asg_launch_template_name" {
  type    = string
  default = "ECS ASG Launch Template"
}

variable "auto_scaling_group_name" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
}

variable "desired_instance_count" {
  type = number
  #  default = 2
}

variable "max_instance_count" {
  type = number
  #  default = 4
}

variable "min_instance_count" {
  type = number
  #  default = 2
}

variable "env" {
  type = string
}