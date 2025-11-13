#!/bin/bash

SOURCE_DIR=$(id -u)
DEST_DIR=$2
DAYS=${3:-14}

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
USERID=$(id -u)

LOGS_FOLDER="/var/log/shellscript-logs"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"

if [ $USERID -ne 0 ]
    then 
        echo -e "$R ERROR: Please run this script with root access $N" | tee -a $LOG_FILE
        exit 1
    else 
        echo -e "$G you are running with root accesss $N" | tee -a $LOG_FILE
    fi

VALIDATE (){
if [ $1 -eq 0 ]
then 
echo -e " $2 is ... $G Success $N" | tee -a $LOG_FILE
else
echo -e " $2 ... $R Failed $N" | tee -a $LOG_FILE
exit 1
fi 
}

mkdir -p $LOGS_FOLDER

usage (){
    echo -e "$R USAGE: $N sh 20-backupscript.sh <source-dir> <destination-dir> <days(optional)>"
}

if [ $# -lt 2 ]
then 
    USAGE
fi

if [ ! -d $SOURCE_DIR ]
then
    echo -e "$R $SOURCE_DIR does not exist. Please check $N"
    exit 1
fi
if [ ! -d $DEST_DIR_DIR ]
then
    echo -e "$R $DEST_DIR does not exist. Please check $N"
    exit 1
fi

