variable "region" {
  type    = string
  default = "us-east-2"
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "instance_name" {
  type    = string
  default = "Server"
}

variable "launch_template_name" {
  type    = string
  default = "My Launch Template"
}

variable "min_instance_count" {
  type    = number
  default = 2
}

variable "desired_instance_count" {
  type    = number
  default = 2
}

variable "max_instance_count" {
  type    = number
  default = 4
}

#----------------------------------------------------
variable "vpc_name" {
  type    = string
  default = "My VPC"
}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "subnet_name" {
  type    = string
  default = "My Subnet"
}

variable "subnet_cidr" {
  type    = string
  default = "10.0.1.0/24"
}

variable "security_group_name" {
  type    = string
  default = "WebServer Security Group"
}

variable "security_group_description" {
  type    = string
  default = "SSH, HTTP, HTTPS"
}

variable "security_group_ingress_ports" {
  type    = list(string)
  default = ["22", "80", "443"]
}

variable "ecs_cluster_name" {
  type    = string
  default = "My ECS Cluster"
}

variable "task_family" {
  type    = string
  default = "author-app"
}

variable "container_image" {
  type    = string
  default = "073487192952.dkr.ecr.us-east-2.amazonaws.com/author_repo:75039650-0f8768fc4ff9"
}

variable "container_ports" {
  type    = list(string)
  default = ["3001"]
}

variable "env" {
  type    = string
  default = "development"
}

variable "project" {
  type    = string
  default = "learn-cicd"
}