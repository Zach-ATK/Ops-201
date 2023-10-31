#!/bin/bash

# Script Name:                  sysinfo.sh
# Author:                       Zachariah Woodbridge
# Date of latest revision:      31/10/2023
# Purpose:                      Ops Challenge: Class 07 - System Information


# Declaration of variables
lshw_output=$(lshw)

# Declaration of functions
display_info() {
    component="$1"
    echo "Computer Name: $lshw_output" | head -n 1
    echo "=================================================="
    echo "~~~~~~~~~~~~~ $component Information ~~~~~~~~~~~~~"
    if [ "$component" == "CPU" ]; then
        echo "$lshw_output" | grep -A 5 "$component" | grep -E "product:|vendor:|physical id:|bus info:|width:"
    elif [ "$component" == "System Memory" ]; then
        echo "$lshw_output" | grep -A 3 "$component" | grep -E "description:|physical id:|size:"
    elif [ "$component" == "display" ]; then
        echo "$lshw_output" | grep -A 12 "$component" | grep -E "description:|product:|vendor:|physical id:|bus info:|width:|clock:|capabilities:|configuration:|resources:"
    elif [ "$component" == "network" ]; then
    #In this case I am using a unique ethernet card, so I tried as best I could to include all the info, but it might be non-standard.
        echo "$lshw_output" | grep -A 17 "$component" | grep -E "description:|product:|vendor:|physical id:|bus info:|logical name:|version:|serial:|size:|capacity:|width:|clock:|capabilities:|configuration:|resources:"
    else 
        echo ""
    fi
}
#Main
# Checks if script is running in root
if [ "$EUID" -ne 1 ]; then
    echo "you may continue"
    sleep 2
else
    echo "Please run this script as root using sudo."
    exit 1
fi

# Display information for each of these components
display_info "CPU"
sleep 3
display_info "System Memory"
sleep 3
display_info "display"
sleep 3
display_info "network"

# Exit with success, I guess this isn't necessary - learning new things
exit 0
