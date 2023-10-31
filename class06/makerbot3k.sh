#! /bin/bash

# Script Name:                  Makerbot3k
# Author:                       Zachariah Woodbridge
# Date of latest revision:      30/10/2023
# Purpose:                      Ops Challenge: Class 06 - Making files or Folders

# Declaration of variables
array=()
# Declaration of functions

# Main
# A loop to bring the user back to the top until they exit
while true; do
    echo " "
    echo "Are you looking to find & create a file or directory?"
    read -p "(type 1 for file or 2 for dir):" num
    # If then conditional, this creates the file if the person chooses it
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
    # If then conditional, this creates the directory if the person chooses it
    elif [ "$num" == 2 ]; then
    read -p "A directory huh? What directory?" dir
        if [ -e "$dir" ]; then
            echo -e "Looks like '$dir' is there."
        else
            mkdir "$dir"
            array+=("$dir")
            echo "Directory '$dir' created."
        fi
    # simple command for when the user selects the wrong option
    else
    echo "now you are really wasting my time."
    fi
    # array, this could have been done with ls, but I needed to insert an array
    echo "these are your current changes:"
    for chg in "${array[@]}"; do
        echo "$chg"
    done
done
#End
