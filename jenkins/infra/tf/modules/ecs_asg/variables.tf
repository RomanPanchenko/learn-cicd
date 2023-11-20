variable "launch_template_name" {
  type    = string
  default = "ECS Launch Template"
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "instance_name" {
  type    = string
  default = "Server"
}

variable "security_groups" {
  type    = list(string)
  default = []
}

variable "key_name" {
  type    = string
  default = ""
}

variable "ecs_cluster_id" {
  type = string
}

variable "asg_launch_template_name" {
  type    = string
  default = "ECS ASG Launch Template"
}

variable "aws_ami_owner" {
  type    = string
  default = "099720109477"
}

variable "aws_ami_filter_values" {
  type    = list(string)
  default = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-2023*"]
}

variable "vpc_id" {
  type = string
}

variable "desired_instance_count" {
  type    = number
  default = 2
}

variable "max_instance_count" {
  type    = number
  default = 4
}

variable "min_instance_count" {
  type    = number
  default = 2
}

variable "env" {
  type    = string
  default = "development"
}