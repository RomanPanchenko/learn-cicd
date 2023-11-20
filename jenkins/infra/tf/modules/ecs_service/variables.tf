variable "ecs_cluster_id" {
  type = string
}

variable "ecs_service_name" {
  type    = string
  default = "ECS Service"
}

variable "desired_container_count" {
  type    = number
  default = 2
}

variable "subnet_ids" {
  type    = list(string)
  default = []
}

variable "security_groups" {
  type    = list(string)
  default = []
}

variable "task_family" {
  type = string
}

variable "task_cpu" {
  type    = number
  default = 1600
}

variable "task_memory" {
  type    = number
  default = 600
}

variable "task_network_mode" {
  type    = string
  default = "bridge"
}

variable "container_cpu" {
  type    = number
  default = 800
}

variable "container_memory" {
  type    = number
  default = 300
}

variable "container_ports" {
  type    = list(string)
  default = []
}

variable "container_name" {
  type = string
}

variable "container_image" {
  type = string
}

variable "env" {
  type    = string
  default = "development"
}