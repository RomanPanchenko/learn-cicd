provider "aws" {
  region = "us-east-2"

  default_tags {
    tags = {
      Project = "Learn CI/CD"
      Owner   = "Roman Panchenko"
    }
  }
}

resource "aws_ecr_repository" "author_repo" {
  name = "author_repo"

  tags = {
    Name = "Author ECR"
  }
}

resource "aws_ecr_repository" "book_repo" {
  name = "book_repo"

  tags = {
    Name = "Book ECR"
  }
}