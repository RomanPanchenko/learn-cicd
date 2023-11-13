#!/bin/bash
sudo dnf update

# Install Docker
sudo dnf install docker
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -aG docker $USER
newgrp docker


echo Pull from ECR image ${docker_image_uri} > /home/111.txt