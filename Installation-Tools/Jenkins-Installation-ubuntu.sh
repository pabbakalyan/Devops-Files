#!/bin/bash

--- INSTALL JENKINS ---

sudo apt-get update
sudo apt install openjdk-11-jre -y
sudo apt-get install maven -y

curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update -y 
sudo apt-get install jenkins -y

sudo systemctl enable jenkins
sudo systemctl start jenkins
sudo systemctl status jenkins

By default Jenkins will run on 8080 port 
if we wantt to change the port in jenkins configuration file 

sudo systemctl stop jenkins
sudo systemctl status jenkins
cd /etc/default
sudo vi jenkins   #chnage port HTTP_PORT=8090 and save and exit
cd /lib/systemd/system
sudo vi jenkins.service  #change Environments="Jenkins_port=8090" save and exit
sudo systemctl daemon-reload
sudo systemctl restart jenkins
sudo systemctl status jenkins

now the jenkins server will open in 8090 port

------------------Official Page-------------------

https://www.jenkins.io/doc/book/installing/linux/#debianubuntu
In oTher way
jenkins . war file
wget https://updates.jenkins.io/download/war/2.387.3/jenkins.war
java -jar jenkins.war --httpPort=8082
