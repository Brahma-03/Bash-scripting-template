#!/bin/bash

sample()
{
echo "hai fro the sample function"
echo "i will be printing the uptime"
uptime
}

stat()

{
    echo "Load Average on the system from last 1 min is : $(uptime |awk -f : '{print $NF}' | awk -f  '{print $1}')"
    echo "Number of users signed in is : $(who|wc-1)"

    echo "start Function is completed  bye"
}


