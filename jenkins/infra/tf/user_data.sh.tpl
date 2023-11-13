#!/bin/bash
sudo dnf update

# Install Docker
sudo dnf install docker
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -aG docker $USER
newgrp docker

mkdir /home/repo
cd /home/repo

git clone https://github.com/RomanPanchenko/learn-cicd.git
cd ./learn-cicd/jenkins
docker build -t myjenkins-blueocean:2.414.3-1 .

#echo Pull from ECR image ${docker_image_uri} > /home/111.txt