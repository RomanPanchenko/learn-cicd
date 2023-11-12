terraform {
  backend "s3" {
    bucket = "${var.remote_state_bucket}"
    key    = "${var.project}/${var.env}/terraform.tfstate"
    region = "${var.remote_state_region}"
  }
}

provider "aws" {
  region = "us-east-2"

  default_tags {
    tags = {
      Project = "Learn CI/CD"
      Owner   = "Roman Panchenko"
    }
  }
}

