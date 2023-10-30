#! /bin/bash

# Script Name:                  PID Killer
# Author:                       Zachariah Woodbridge
# Date of latest revision:      28/10/2023
# Purpose:                      Ops Challenge: Class 05 - If, For, and While
#                               display PID, and give option to kill the preoccess

# Declaration of variables
array=()
# Declaration of functions

# Main
while true; do
    echo " "
    echo "Are you looking to find & create a file or directory?"
    read -p "(type 1 for file or 2 for dir):" num
    if [ "$num" == 1 ]; then
    read -p "A file huh? What file?" file
        if [ -e "$file" ]; then
            echo -e "Looks like '$file' already exists, stop waisting my time."
            sleep 1
        else
            touch "$file"
            echo "file '$file' created."
            array+=("$file")
            sleep 1
        fi
    elif [ "$num" == 2 ]; then
    read -p "A directory huh? What directory?" dir
        if [ -e "$dir" ]; then
            echo -e "Looks like '$dir' is there."
        else
            mkdir "$dir"
            array+=("$dir")
            echo "Directory '$dir' created."
        fi
    else
    echo "now you are really wasting my time."
    fi
    echo "these are your current changes:"
    for chg in "${array[@]}"; do
        echo "$chg"
    done
done
#End
