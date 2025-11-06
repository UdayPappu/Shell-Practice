#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then 
echo "ERROR: Please run this script with root access"
exit 1
else 
echo "you are running with root accesss"
fi

dnf list installed mysql

if [ $? -ne 0]
then 
echo "MYSQL is not installed... going to install"
dnf install mysql -y

if [ $? -eq 0 ]
then 
echo "Installing MQSQL is ... Success"
else
echo "Installation ... Failed"
exit 1
fi 

else
echo "MYSQL is already installed..."
fi 


