output "author_ecr" {
  value = aws_ecr_repository.author_repo.repository_url
}

output "book_ecr" {
  value = aws_ecr_repository.book_repo.repository_url
}