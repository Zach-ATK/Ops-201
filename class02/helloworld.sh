#!/bin/bash

# Script Name:                  Hello World
# Author:                       Zachariah Woodbridge
# Date of latest revision:      24/10/2023
# Purpose:                      Ops Challenge: Class 02

# Declaration of variables
txt1="Hello World"
txt2="I am working perfectly!"
# Declaration of functions
# My echo functions
echo1 () {
   echo -e "${txt1}"
}
echo2 () {
   echo -e "${txt2}"
}
# Main
echo1
echo2
# End
