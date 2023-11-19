variable "vpc_id" {
  type = string
}

variable "vpc_name" {
  type = string
}

variable "vpc_description" {
  type = string
}

variable "ingress_ports" {
  type    = list(string)
  default = ["80", "443"]
}

variable "security_group_name" {
  type    = string
  default = "Security Group"
}

variable "env" {
  type    = string
  default = "development"
}
