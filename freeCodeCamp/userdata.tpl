#!/bin/bash
sudo apt update -y 
sudo apt upgrade -y
sudo apt install -y - apt-transport-https ca-certificates curl gnupg-agent software-properties-common httpd
systemctl start httpd
systemctl enable httpd
echo "Hello World from $(hostname -f)" > /var/www/html/index.html