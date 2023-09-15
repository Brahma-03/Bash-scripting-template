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

  yum install -y mongodb-org  >> /tmp/${comp}.log

  echo  -n "Updating the $component config"
  sed -i -e 's/127.0.0.1/0.0.0.0/' /etc/mongo
  
  if [ $? -eq 0 ] ; 
  then
    echo -e "\e[32m Success \e[0m"
    else
    echo -e "\e[31m failure. Look for the logs \e[0m"
    fi

  echo -n "start the component service"

  systemctl enable mongod  >> /tmp/${comp}.log
  
  systemctl start mongod


  if [ $? -eq 0 ] ; 
  then
    echo -e "\e[32m Success \e[0m"
    else
    echo -e "\e[31m failure. Look for the logs \e[0m"
    fi

    
