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

dnf list install MySql

if [ $? -ne 0 ] # ne is not equal to
then
    echo "MySql is NOT Installed..Hence Going to Install it NOW"
dnf install MySql -y
if [ $? -eq 0 ] #if exit status $? is equal to zero then
then
    echo "Installing MySql is SUCCESS"
else
    echo "Installing MySql is FAILURE"
exit 1
fi
else
    echo "MySql is ALREADY INSTALLED Nothing to do"
fi