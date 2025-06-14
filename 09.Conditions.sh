#!/bin/bash

NUMBER=$!

# -gt --> greater than
# -lt --> less than
# -eq --> equal
# -ne --> not equal

if [ $NUMBER -lt 10 ]
then
    echo "Given Number $NUMBER is less than 10"
else
    echo "Given Number $NUMBER is not less than 10"
fi