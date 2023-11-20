variable "region" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "ingress_ports" {
  type    = list(string)
}

variable "security_group_name" {
  type    = string
}

variable "security_group_description" {
  type    = string
}

variable "env" {
  type    = string
}
