#!/bin/bash


comp=mongodb



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
  sed -i -e 's/127.0.0.1/0.0.0.0/' /etc/mongod.conf
  
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

  echo -n "Downloading the Schema"

  curl -s -L -o /tmp/mongodb.zip "https://github.com/stans-robot-project/mongodb/archive/main.zip"

  if [ $? -eq 0 ] ; 
  then
    echo -e "\e[32m Success \e[0m"
    else
    echo -e "\e[31m failure. Look for the logs \e[0m"
    fi

    echo -n "Extracting the component"

    cd /tmp  && unzip mongodb.zip  && cd mongodb-main
    if [ $? -eq 0 ] ; 
     then
    echo -e "\e[32m Success \e[0m"
    else
    echo -e "\e[31m failure. Look for the logs \e[0m"
    fi

    mongo < catalogue.js  >> /tmp/${comp}.log    && mongo < users.js  >> /tmp/${comp}.log
if [ $? -eq 0 ] ; 
     then
    echo -e "\e[32m Success \e[0m"
    else
    echo -e "\e[31m failure. Look for the logs \e[0m"
    fi
  