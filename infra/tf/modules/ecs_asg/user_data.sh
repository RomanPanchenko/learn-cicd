#!/bin/bash
sudo yum update -y

# Install ECS Agent
sudo yum install -y ecs-init
sudo start ecs

# Install Docker
sudo yum install docker -y
sudo systemctl enable docker
sudo systemctl start docker
sudo usermod -a -G docker ec2-user

