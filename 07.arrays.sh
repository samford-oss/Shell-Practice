#!/bin/bash

MOVIES=("Court" "HIT3" "DEVARA" "PUSPA2") #TOTAL WE HAVE 4 VALUES STORED WITH POSITIONS 0 1 2 3
       #  0       1       2        3  positions

# NOW I WANT TO PRINT FIRST MOVIE
echo "FRIST MOVIE: ${MOVIES[0]}" # we are keeping flower braces means everything inside of it works as variable
echo "Last MOVIE name: ${MOVIES[3]}"

echo "All Movies list: ${MOVIES[@]}" #TO display all movies we are using @ symbol