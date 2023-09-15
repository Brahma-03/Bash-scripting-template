#!/bin/bash


comp=mongodb

s

echo -n "Configuring the mongoDB"
curl -s -o /etc/yum.repos.d/${comp}.repo https://raw.githubusercontent.com/stans-robot-project/mongodb/main/mongo.repo


if [ $? -eq 0 ] ; 
then
    echo -e "\e[32m Success \e[0m"
    else
    echo -e "\e[31m failure. Look for the logs \e[0m"
    fi

  yum install -y mongodb-org

  echo "Updating thee $component config"
#   sed -i -e 's/
  

#   systemctl enable mongod
  
#   systemctl start mongod
