#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ] # if USERID NOT EQUAL NE TO ZERO THEN
then
    echo "ERROR:: Please RUN the Script with ROOT USER Access"
    exit 1 
    # Exit Status starts from 0 to 127 where 0 = SUCCESS and remaning than 0 all are FAILURE
    # So whenever we endup with error in the script command line then below it must write exit 1
    #To check status of exit status "$?" exmp: $ echo $?
else
    echo "You are Running with ROOT Access"
fi
# Till here we CHECKED whether the user is ROOT or NOT

#Now lets INSTALL MySQL, nginx, python3

# Before we install lets automate if & else repeated conditions as VALIDATE

VALIDATE () {
    if [ $1 -eq 0 ]
    then
        echo "INSTALLING $2 is .... SUCCESS"
    else
        echo "INSTALLING $2 is .... FAILURE"
        exit 1
    fi
}
#Now lets install mysql:

dnf list installed mysql
if [ $? -ne 0 ]
then
    echo "mysql is not installed...going to install it"
    dnf install mysql -y
    VALIDATE $? "mysql"
else
    echo "mysql is already installed....Nothing to do"
fi

#Now lets install python3:

dnf list installed python3
if [ $? -ne 0 ]
then
    echo "python3 is not installed...going to install it"
    dnf install python3 -y
    VALIDATE $? "python3"
else
    echo "python3 is already installed....Nothing to do"
fi

#Now lets install nginx:

dnf list installed nginx
if [ $? -ne 0 ]
then
    echo "nginx is not installed...going to install it"
    dnf install nginx -y
    VALIDATE $? "nginx"
else
    echo "nginx is already installed....Nothing to do"
fi