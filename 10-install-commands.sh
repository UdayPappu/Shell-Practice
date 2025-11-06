#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then 
echo "ERROR: Please run this script with root access"
exit 1
else 
echo "you are running with root accesss"
fi

dnf install mysql -y

if [ $? -eq 0 ]
then 
echo "Installing MQSQL is ... success"
else
echo "Installation failed"
exit 1
fi 

