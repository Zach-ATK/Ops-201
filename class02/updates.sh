#!/bin/bash

# Script Name:                  Updates.sh
# Author:                       Zachariah Woodbridge
# Date of latest revision:      24/10/2023
# Purpose:                      Updates the ubuntu applications and removes/cleans old files

# Declaration of variables

# Color variables
YLW='\033[1;33m' # establishes yellow color
RED='\033[0;31m' # establishes red color
GRN='\033[0;32m' # establishes green color
NC='\033[0m' # resets the color to default
BASHRC='~/.bashrc'

# Define the installation directory (where the script will be copied)
install_dir="/usr/bin"

# Define the script filename
script_name="updates.sh"

#Text Variables
txt="${GRN}I am done! ${NC}"

# Declaration of functions
#SETTING UP A PRINT FUNCTION
tell-the-world () {
   echo -e "${txt}"
}
# Main

#Welcome Message
echo -e "${YLW}Welcome to Zachatk's startup script!${NC}"

#Editing .bashrc to include running updates.sh on startup

if grep -Fxq "bash /usr/bin/updates.sh" ~/.bashrc
then #script if already installed
    echo -e "${RED}Startup Running${NC}" 

    # Update
    echo -e "${RED}Downloading Updates...${NC}"
    sudo apt update

    # Upgrade
    echo -e "${RED}Upgrading Packages${NC}"
    sudo apt upgrade -y

    # Autoremove old Packages
    echo -e "${RED}Autoremoving Old Packages${NC}"
    sudo apt autoremove -y

    # Cleanup
    echo -e "${RED}Cleaning up erronius system files${NC}"
    sudo apt clean -y
    tell-the-world
else
    echo -e "${RED}Initial Startup${NC}" 
    # script if the first installation
    echo "#Zachatk's Update Script" >> ~/.bashrc
    echo "bash /usr/bin/updates.sh" >> ~/.bashrc

    # Define the installation directory (where the script will be copied)
    install_dir="/usr/bin"

    # Define the script filename
    script_name="updates.sh"

    # Copy the script to the installation directory
    sudo cp "$0" "$install_dir/$script_name"

    # Make the copied script executable
    sudo chmod +x "$install_dir/$script_name"

    echo "Script installed in $install_dir/$script_name"

    # Update
    echo -e "${RED}Downloading Updates...${NC}"
    sudo apt update

    # Upgrade
    echo -e "${RED}Upgrading Packages${NC}"
    sudo apt upgrade -y

    # Autoremove old Packages
    echo -e "${RED}Autoremoving Old Packages${NC}"
    sudo apt autoremove -y

    # Cleanup
    echo -e "${RED}Cleaning up erronius system files${NC}"
    sudo apt clean -y
    tell-the-world
fi
# End