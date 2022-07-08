#!/bin/bash
echo Starting processes


echo ---> [1] check updates to linux
sudo apt update && sudo apt upgrade -y

echo ---> [2] Older versions of Docker were called docker, docker.io, or docker-engine. If these are installed, uninstall them:
sudo apt-get remove docker docker-engine docker.io containerd runc

echo ---> [3] Install packages to allow apt to use a repository over HTTPS:
sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
    
echo ---> [4] Add Docker’s official GPG key:
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo y

echo ---> [5] set up the repository:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  
echo ---> [6] Install docker
sudo apt-get update && sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y

echo ---> [7] Create container in docker
sudo docker run -d --name serverdz -p 3306:3306 -v ~/backupDB:/var/lib/mysql davidkudev/server-diazar

echo ---> [8] Accessing the container
sudo docker exec -it serverdz bash

echo Processes finished
