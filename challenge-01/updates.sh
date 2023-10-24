#!/bin/bash

# Script Name:                  Updates.sh
# Author:                       Zachariah Woodbridge
# Date of latest revision:      24/10/2023
# Purpose:                      Updates the ubuntu applications and removes/cleans old files

# Declaration of variables
#DEFINING COLORS USED
RED='\033[0;31m' #establishes a color for text (in this case red)
GREEN='\033[0;32m' #establishes a color for text (in this case green)
NC='\033[0m' #meaning No Color, resets the coloration of notifications

#TEXT VARIABLE
txt="${GREEN}I am working perfectly!${NC}"


# Declaration of functions
#SETTING UP A PRINT FUNCTION
tell-the-world () {
   echo -e "${txt}"
}
# Main


# UPDATE
echo -e "${RED}UPDATE${NC}"
sudo apt update
# UPGRADE
echo -e "${RED}UPGRADE${NC}"
sudo apt upgrade -y
# AUTOREMOVE OLD PROGRAMS
echo -e "${RED}AUTOREMOVE${NC}"
sudo apt autoremove -y
# CLEANUP
echo -e "${RED}CLEANUP${NC}"
sudo apt clean -y
tell-the-world
# End
