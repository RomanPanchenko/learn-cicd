variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "instance_name" {
  type    = string
  default = "Server"
}

#----------------------------------------------------
variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "env" {
  type    = string
  default = "Dev"
}

variable "project" {
  type    = string
  default = "learn-cicd"
}

#variable "remote_state_bucket" {
#  type = string
#}
#
#variable "remote_state_region" {
#  type = string
#}