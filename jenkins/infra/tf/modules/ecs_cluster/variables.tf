variable "ecs_cluster_name" {
  type    = string
  default = "Cluster"
}

variable "subnet_id" {
  type = string
}

variable "instance_name" {
  type    = string
  default = "Server"
}

variable "instance_count" {
  type    = number
  default = 2
}

variable "security_groups" {
  type    = list(string)
  default = []
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "ami_owner" {
  type    = string
  default = "099720109477"
}

variable "ami_filter_values" {
  type    = list(string)
  default = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-2023*"]
}

variable "key_name" {
  type    = string
  default = ""
}

variable "env" {
  type    = string
  default = "development"
}