#!/bin/bash

# Script Name:                  domanalyser.sh
# Author:                       Zachariah Woodbridge
# Date of latest revision:      08/11/2023
# Purpose:                      Challenge 13 - Domain Analyzer

# Declaration of variables (these are dumb, but work)
# whois variable
whois1='whois "$domain_name" >> "$domain_name-results.txt"'

# dig variable
dig1='dig $domain_name >> "$domain_name-results.txt"'

# host variable
host1='host $domain_name >> "$domain_name-results.txt"'

# nslookup variable
nslookup1='nslookup $domain_name >> "$domain_name-results.txt"'
# Declaration of functions

# Function to perform whois, dig, host, and nslookup and save the results to a .txt file
perform_network_checks() {
    # Perform whois and save to .txt
    eval ${whois1}
    # Perform dig and save to .txt
    eval ${dig1}
    # Perform host and save to .txt
    eval ${host1}
    # Perform nslookup and save to .txt
    eval ${nslookup1}

    echo "Results have been saved to $domain_name-results.txt"
}

# Main
read -p "Enter a domain name (e.g., google.com): " domain_name
perform_network_checks
# End
