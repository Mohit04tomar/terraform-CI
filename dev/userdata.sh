#!/bin/bash
yum update -y
yum install httpd -y
systemctl start httpd
systemctl enable httpd
echo "Terraform Module Architecture" > /var/www/html/index.html