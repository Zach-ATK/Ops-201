# Script Name:                  NetworkReport
# Author:                       Zachariah Woodbridge
# Date of latest revision:      07/11/2023
# Purpose:                      Challenge 12 - Powershell IP Analysis

# Declaration of variables
$echoip = echo $ipv4Addresses

# Declaration of functions
 # Generates the network report and saves it as network_report.txt
function Generate-NetworkReport {
    ipconfig /all > network_report.txt
}

 # Searches for and returns IPv4 addresses from the network report using Select-String
function Get-IPv4Addresses {
    $ipv4Addresses = Select-String -Path network_report.txt -Pattern 'IPv4 Address'
    return $ipv4Addresses
}

# Main
 # Generates the network report
Generate-NetworkReport

 # Get and display IPv4 addresses from the network report
$ipv4Addresses = Get-IPv4Addresses
$echoip
 # Remove the network report file
Remove-Item network_report.txt -Force
