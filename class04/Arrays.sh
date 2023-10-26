#!/bin/bash

# Script Name:                  Arraying Arrays
# Author:                       Zachariah Woodbridge
# Date of latest revision:      26/10/2023
# Purpose:                      Ops Challenge - Arrays
#                               create some directories, put files in them

# Declaration of variables
#I am simply naming the variables in my array... I try to keep it simple
dir=("d1" "d2" "d3" "d4")
# Declaration of functions

# Main
# I can make directories all DAY, at first I tried making my directories manually, 
# but then I remembered 'touch' will do it for you!
# Thank god for for loops :)

for d in "${dir[@]}"; do
    mkdir "$d"
    touch ${d}/${d}.txt
done
#As you can see, all folders and .txt files are there!
#End