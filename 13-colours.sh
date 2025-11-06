#!/bin/bash

#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[33m"
Y="\e[33m"
N="\e[0m"

if [ $USERID -ne 0 ]
then 
echo -e "$R ERROR: Please run this script with root access $N"
exit 1
else 
echo "$G you are running with root accesss $N"
fi

VALIDATE (){
if [ $1 -eq 0 ]
then 
echo -e "Installing $2 is ... $G Success $N"
else
echo -e "Installation $2 ... $R Failed $N"
exit 1
fi 
}


dnf list installed mysql
if [ $? -ne 0 ]
then 
echo "MYSQL is not installed... going to install"
dnf install mysql -y
VALIDATE $? "MYSQL"
else
echo -e "$Y MYSQL is already installed... $N"
fi 

dnf list installed python3
if [ $? -ne 0 ]
then 
echo "python3 is not installed... going to install"
dnf install python3 -y
VALIDATE $? "Python3"
else
echo -e "$Y python3 is already installed... $N"
fi 


dnf list installed nginx
if [ $? -ne 0 ]
then 
echo "nginx is not installed... going to install"
dnf install nginx -y
VALIDATE $? "nginx"
else
echo -e "$Y nginx is already installed... $N"
fi 

