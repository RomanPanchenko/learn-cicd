variable "aws_ami_owner" {
  type    = string
  default = "099720109477"
}

variable "aws_ami_filter_values" {
  type    = list(string)
  default = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-2023*"]
}

variable "instance_count" {
  type  = number
  value = 1
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "instance_name" {
  type    = string
  default = "Server"
}

variable "key_name" {
  type    = string
  default = ""
}

variable "security_groups" {
  type    = list(string)
  default = []
}

variable "env" {
  type    = string
  default = "development"
}
