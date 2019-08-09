#!/bin/bash

# install dependencies
sudo apt update
sudo apt install -y openjdk-8-jdk
sudo apt install -y wget
sudo apt install -y vim

#create user for Jenkins
sudo useradd --create-home jenkins
#set jenkins default shell to bash
sudo usermod --shell /bin/bash jenkins

#switch user to jenkins, remove existing war file if available and download latest
sudo su - jenkins -c "rm jenkins.war"
sudo su - jenkins -c "wget http://updates.jenkins-ci.org/latest/jenkins.war"
sudo su - jenkins -c "whoami"
sudo su - jenkins -c "echo was set-up"
#       set up PATH

# create vim file for service script
sudo touch /etc/systemd/system/jenkins.service
sudo chmod a=rwx /etc/systemd/system/jenkins.service
echo JENKINS SERVICE CREATED
# populate jenkins.service with template file
sudo cat /home/jenkins/jenkins.service > /etc/systemd/system/jenkins.service
echo JENKINS SERVICE POPULATED
#load new service
sudo systemctl daemon-reload
echo Service loaded

#start Jenkins
sudo systemctl enable jenkins
echo Jenkins started ... Go to localhost:8080

