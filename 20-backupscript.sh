#!/bin/bash

SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-14}
USERID=$(id -u)

R="$(printf '\033[31m')"
G="$(printf '\033[32m')"
Y="$(printf '\033[33m')"
N="$(printf '\033[0m')"


LOGS_FOLDER="/var/log/shellscript-logs"
SCRIPT_NAME=$(printf "%b\n" $0 | cut -d "." -f1)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"
mkdir -p $LOGS_FOLDER
if [ $USERID -ne 0 ]
    then 
        printf "%b\n"  "$R ERROR: Please run this script with root access $N" | tee -a $LOG_FILE
        exit 1
    else 
        printf "%b\n"  "$G you are running with root accesss $N" | tee -a $LOG_FILE
    fi

VALIDATE (){
if [ $1 q 0 ]
then 
printf "%b\n"  " $2 is ... $G Success $N" | tee -a $LOG_FILE
else
printf "%b\n"  " $2 ... $R Failed $N" | tee -a $LOG_FILE
exit 1
fi 
}



USAGE (){

    printf "%b\n"  "$R USAGE: $N sh 20-backupscript.sh <source-dir> <destination-dir> <days(optional)>"
}

if [ $# -lt 2 ]
then 
    USAGE
    exit 1
fi

if [ ! -d $SOURCE_DIR ]
then
    printf "%b\n"  "$R source directory $SOURCE_DIR does not exist. Please check $N"
    exit 1
fi
if [ ! -d $DEST_DIR ]
then
    printf "%b\n"  "$R destination directory $DEST_DIR does not exist. Please check $N"
    exit 1
fi

FILES=$(find $SOURCE_DIR -name "*.log" -mtime +$DAYS)

if [ -z $FILES ]
then
    printf "%b\n" "Files to zip are $FILES "
else
    printf "%b\n" "No files are older than 14 days .. skipping"
fi

