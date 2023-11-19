variable "ec2_instance_ids" {
  type = list(string)
}

variable "env" {
  type    = string
  default = "development"
}