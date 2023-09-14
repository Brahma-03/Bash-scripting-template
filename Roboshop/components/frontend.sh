#!/bin/bash

set -e 

echo -n "Instslling Nginx :"
yum install nginx -y   >> /tmp/frontend.log
systemctl enable nginx

echo -n "Starting nginx:"
systemctl start nginx

if [$1 -eq 0 ] ; 
then
    echo -e "\e[32m Success \e[0m"
    else
    echo -e "\e[31m failure. Look for the logs \e[0m"
    fi

echo -n "Downloading tthe code"
curl -s -L -o /tmp/frontend.zip "https://github.com/stans-robot-project/frontend/archive/main.zip"

if [$1 -eq 0 ] ; 
then
    echo -e "\e[32m Success \e[0m"
    else
    echo -e "\e[31m failure. Look for the logs \e[0m"
    fi

cd /usr/share/nginx/html
rm -rf *
unzip /tmp/frontend.zip  >> /tmp/frontend.log
mv frontend-main/* .
mv static/* .
rm -rf frontend-main README.md
mv localhost.conf /etc/nginx/default.d/roboshop.conf

systemctl restart nginx
echo -n "completed SETUP"

if [$1 -eq 0 ] ; 
then
    echo -e "\e[32m Success \e[0m"
    else
    echo -e "\e[31m failure. Look for the logs \e[0m"
    fi