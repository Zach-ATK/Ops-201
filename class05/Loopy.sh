#!/bin/bash

# Script Name:                  PID Killer
# Author:                       Zachariah Woodbridge
# Date of latest revision:      28/10/2023
# Purpose:                      Ops Challenge: Class 05 - If, For, and While
#                               display PID, and give option to kill the preoccess

# Declaration of variables
i=0
# Declaration of functions
trappy() {
    i=$((i + 1))
    if [ $i -lt 3 ]; then
        echo "I need more PIDs, come on let me kill again"
    else
        echo "....I..... "
        sleep 1
        echo "...SAID..."
        sleep 1
        echo "...MORE..."
        sleep 2
        exit
    fi
}
# Main
trap 'trappy' SIGINT

while true; do
    clear
    echo "==== Running Processes ===="
    ps -as

    #Provides commands AND a prompt, becuase I am fancy
    read -p "What PID would you like killed?
     (press Ctrl + C to exit): " pid

    # Does the PID exist? If yes, KILL KILL KILL, else 
    if ps -p $pid > /dev/null; then
        # Kill the process
        kill $pid
        echo "PID [$pid] has been KILLED!!! Just a few MORE, still hungy hungy."
        sleep 1
    else
        echo " $pid does not exist, give a PID something to kill!"
        sleep 1
    fi
done

# End