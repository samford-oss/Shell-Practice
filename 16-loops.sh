#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
LOGS_FOLDER="/var/log/shellscript-logs"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"
PACKAGES=("mysql" "python" "nginx" "httpd")

mkdir -p $LOGS_FOLDER
echo "Script started executed at: $(date)" | tee -a $LOG_FILE

if [ $USERID -ne 0 ] # if USERID NOT EQUAL NE TO ZERO THEN
then
    echo -e "$R ERROR:: Please RUN the Script with ROOT USER Access $N" | tee -a $LOG_FILE
    exit 1 
    # Exit Status starts from 0 to 127 where 0 = SUCCESS and remaning than 0 all are FAILURE
    # So whenever we endup with error in the script command line then below it must write exit 1
    #To check status of exit status "$?" exmp: $ echo $?
else
    echo "You are Running with ROOT Access" | tee -a $LOG_FILE
fi
# Till here we CHECKED whether the user is ROOT or NOT

#Now lets INSTALL MySQL, nginx, python3

# Before we install lets automate if & else repeated conditions as VALIDATE

VALIDATE () {
    if [ $1 -eq 0 ]
    then
        echo -e "INSTALLING $2 is .... $G SUCCESS $N" | tee -a $LOG_FILE
    else
        echo -e "INSTALLING $2 is .... $R FAILURE $N" | tee -a $LOG_FILE
        exit 1
    fi
}
# Lets write FOR LOOP here:

for package in ${PACKAGES[@]}
do
    dnf list installed $package &>>LOG_FILE
    if [ $? -ne 0 ]
    then
        echo "$package is not installed...going to install it" | tee -a $LOG_FILE
        dnf install $package -y &>>$LOG_FILE
        VALIDATE $? "$package"
    else
    echo -e "$package  is $Y already installed....Nothing to do $N" | tee -a $LOG_FILE
fi
done