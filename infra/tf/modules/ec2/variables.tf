variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "instance_name" {
  type    = string
  default = "Server"
}

# -----------------------------------------------

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