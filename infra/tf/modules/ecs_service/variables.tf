variable "region" {
  type = string
}

variable "ecs_cluster_id" {
  type = string
}

variable "ecs_service_name" {
  type = string
}

variable "desired_container_count" {
  type = number
}

variable "subnet_ids" {
  type = list(string)
}

variable "security_groups" {
  type = list(string)
}

variable "task_family" {
  type = string
}

variable "task_cpu" {
  type = number
}

variable "task_memory" {
  type = number
}

variable "task_network_mode" {
  type = string
}

variable "container_cpu" {
  type = number
}

variable "container_memory" {
  type = number
}

variable "container_ports" {
  type = list(number)
}

variable "container_name" {
  type = string
}

variable "container_image" {
  type = string
}

variable "env" {
  type = string
}