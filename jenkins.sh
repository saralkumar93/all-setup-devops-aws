#!/bin/bash
yum update -y
yum install httpd -y
cd /var/www/html
echo "web server " >index.html
systemctl start httpd
systemctl status httpd

#STEP-1: INSTALLING GIT JAVA-17 and  MAVEN 
#yum install git java-1.8.0-openjdk maven -y
yum install java-17-openjdk.x86_64 maven -y

#STEP-2: GETTING THE REPO (jenkins.io --> download -- > redhat)
yum install wget -y 
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
sudo rpm -ivh https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm

#STEP-3: DOWNLOAD JAVA11 AND JENKINS
#amazon-linux-extras install java-openjdk11 -y
yum install jenkins -y
#update-alternatives --config java

#STEP-4: RESTARTING JENKINS (when we download service it will on stopped state)
systemctl start jenkins.service
systemctl status jenkins.service

