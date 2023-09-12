#!/bin/bash

yum install nginx -y
systemctl enable nginx
systemctl start nginx
curl -s -L -o /tmp/frontennd.zip "https://github.com/stans-robot-project/frontend/archive/main.zip"

cd /usr/share/nginx/html
rm -rf *
unzip /tmp/frontend.zip
mv frontend-main/* .
mv static/* .
rm -rf frontend-main README.md
mv localhost.conf /etc/nginxx/default.d/roboshop.conf

systemctl restart nginx

