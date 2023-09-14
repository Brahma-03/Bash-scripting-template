#!/bin/bash

set -e 

echo -n "Instslling Nginx :"
yum install nginx -y   >> /tmp/frontend.log
systemctl enable nginx

echo -n "Starting nginx:"
systemctl start nginx
stat $?

echo -n "Downloading tthe code"
curl -s -L -o /tmp/frontend.zip "https://github.com/stans-robot-project/frontend/archive/main.zip"
stat $?

cd /usr/share/nginx/html
rm -rf *
unzip /tmp/frontend.zip  >> /tmp/frontend.log
mv frontend-main/* .
mv static/* .
rm -rf frontend-main README.md
mv localhost.conf /etc/nginx/default.d/roboshop.conf

systemctl restart nginx

echo "completed SETUP"
stat$?