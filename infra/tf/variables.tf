variable "env" {
  type    = string
  default = "Development"
}

variable "project" {
  type    = string
  default = "learn-cicd"
}

variable "remote_state_bucket" {
  type    = string
  default = "rpanchenko123-terraform-remote-state"
}

variable "remote_state_region" {
  type  = string
  value = "us-east-2"
}