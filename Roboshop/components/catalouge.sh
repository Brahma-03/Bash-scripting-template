#/!bin/bash

set -e

comp=catalouge

echo  -n "Location Setup"

curl --silent --location https://rpm.nodesource.com/setup_16.x | sudo bash -

if [ $? -eq 0 ] ; 
then
    echo -e "\e[32m Success \e[0m"
    else
    echo -e "\e[31m failure. Look for the logs \e[0m"
    fi

echo -n "Install Nodejs" 

if [ $? -eq 0 ] ; 
then
    echo -e "\e[32m Success \e[0m"
    else
    echo -e "\e[31m failure. Look for the logs \e[0m"
    fi

yum install nodejs -y  >> /tmp/${comp}.log


if [ $? -eq 0 ] ; 
then
    echo -e "\e[32m Success \e[0m"
    else
    echo -e "\e[31m failure. Look for the logs \e[0m"
    fi


echo -n  "adding thee user"
 useradd roboshop 
 # || useradd roboshop

 if [ $? -eq 0 ] ; 
 then
    echo -e "\e[32m Success \e[0m"
    else
    echo -e "\e[31m failure. Look for the logs \e[0m"
    fi

 echo "downloading thee component"

 curl -s -L -o /tmp/${comp}.zip "https://github.com/stans-robot-project/catalogue/archive/main.zip"

 if [ $? -eq 0 ] ; 
 then
    echo -e "\e[32m Success \e[0m"
    else
    echo -e "\e[31m failure. Look for the logs \e[0m"
    fi

    
echo "clean up old component"

 cd /home/roboshop && unzip /tmp/${comp}.zip && mv ${comp}-main ${comp} && cd /home/roboshop/${comp} && npm install

if [ $? -eq 0 ] ; 
 then
    echo -e "\e[32m Success \e[0m"
    else
    echo -e "\e[31m failure. Look for the logs \e[0m"
    fi



 sed  systemd.servce

  mv /home/roboshop/${comp}/systemd.service /etc/systemd/system/${comp}.service
 systemctl daemon-reload
 systemctl start ${comp}
 systemctl enable ${comp}
 systemctl status ${comp} -l

