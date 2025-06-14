#!/bin/bash

echo "All variables passed to the script: $@"
echo "Number of Variables: $#"
echo "Script Name: $0"
echo "Current Directory: $PWD"
echo "User Running this script: $USER"
echo "Home Directory: $HOME"
echo "PID of the script: $$"
sleep 10 & # running background
echo "PID of the last command in Background: $!"
# To see output type sh 08.Special-vars.sh Devops AWS Azure