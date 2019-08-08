#!/bin/bash
# jenkins install for centos-7
latest_war="https://updates.jenkins-ci.org/latest/jenkins.war"
packages="java wget"
sudo apt install -y ${packages}
mkdir -p ${JENKINS_HOME}
wget ${latest_war} ${JENKINS_HOME}
sudo cp ~/jenkins.service /etc/systemd/system/jenkins.service

