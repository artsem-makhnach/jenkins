#!/bin/bash

yum install -y java-1.8.0-openjdk-devel.x86_64
yum install -y git

#sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo

#rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key

#yum install -y jenkins

mkdir /usr/lib/jenkins
sudo wget -O /usr/lib/jenkins/jenkins.war http://mirrors.jenkins.io/war-stable/latest/jenkins.war

echo "JENKINS_HOME=/vagrant/.jenkins/" >> /etc/environment

export JENKINS_HOME=/vagrant/.jenkins/

yum install -y nginx

sed -i ':a;$!{N;ba};s/location \/ {/location \/ { proxy_pass http:\/\/192.168.56.10:8080\/;/' /etc/nginx/nginx.conf

systemctl start nginx

nohup java -jar /usr/lib/jenkins/jenkins.war &




