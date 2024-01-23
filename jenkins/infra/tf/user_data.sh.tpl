#!/bin/bash
sudo yum update -y

# Install ECS Agent
sudo yum install -y ecs-init
sudo ecs-cli configure --cluster your-cluster-name --region your-region
sudo systemctl enable ecs
sudo systemctl start ecs

# Install Docker
sudo yum install docker -y
sudo systemctl enable docker
sudo systemctl start docker
sudo usermod -a -G docker ec2-user

# Install Git
sudo yum install git -y

# Install Jenkins
sudo yum install java-1.8.0-amazon-corretto -y
sudo yum install java-1.8.0-amazon-corretto-devel -y
sudo yum install java-11-amazon-corretto -y
sudo yum install java-11-amazon-corretto-devel -y

sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
sudo yum upgrade

sudo yum install jenkins -y

sudo systemctl enable jenkins
sudo systemctl start jenkins
sudo usermod -a -G docker jenkins
