#!/bin/bash
sudo yum update -y

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
sudo usermod -aG docker jenkins




#mkdir /home/ec2-user/repo
#cd /home/ec2-user/repo

#git clone https://github.com/RomanPanchenko/learn-cicd.git
#cd learn-cicd/jenkins
#docker build -t myjenkins-blueocean:2.414.3-1 .

#docker run --name jenkins-blueocean --restart=on-failure --detach ^
#  --network jenkins --env DOCKER_HOST=tcp://docker:2376 ^
#  --env DOCKER_CERT_PATH=/certs/client --env DOCKER_TLS_VERIFY=1 ^
#  --volume jenkins-data:/var/jenkins_home ^
#  --volume jenkins-docker-certs:/certs/client:ro ^
#  --publish 8080:8080 --publish 50000:50000 myjenkins-blueocean:2.414.3-1

#echo Pull from ECR image ${docker_image_uri} > /home/111.txt