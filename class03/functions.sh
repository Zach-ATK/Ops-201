#!/bin/bash

# Script Name:                  login history
# Author:                       Zachariah Woodbridge
# Date of latest revision:      25/10/2023
# Purpose:                      Challenge 03 - Functions

# Declaration of variables
YLW='\033[1;33m' # establishes yellow color
NC='\033[0m' # resets the color to default
# Declaration of functions
loginhist () {
 last
 echo -e "${YLW}This is the login history${NC}"   
}
# Main
echo -e "${YLW}One......${NC}"
loginhist
echo -e "${YLW}Two......${NC}"
loginhist
echo -e "${YLW}Three......${NC}"
loginhist
# End