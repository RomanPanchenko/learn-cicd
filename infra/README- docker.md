# Build docker image
docker build -t author-app:latest .

# Tag docker image
docker tag author-app:latest 073487192952.dkr.ecr.us-east-2.amazonaws.com/author_repo:latest

# Authenticate docker to be able to push images
# If "aws" is not configured type "aws configure" 
aws ecr get-login-password --region us-east-2 | docker login --username AWS --password-stdin 073487192952.dkr.ecr.us-east-2.amazonaws.com

# Push docker image to the repository
docker push 073487192952.dkr.ecr.us-east-2.amazonaws.com/author_repo:latest

