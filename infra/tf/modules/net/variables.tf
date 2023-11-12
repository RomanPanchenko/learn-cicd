variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "env" {
  type = string
}

variable "project" {
  type = string
}

variable "remote_state_bucket" {
  type = string
}

variable "remote_state_region" {
  type = string
}