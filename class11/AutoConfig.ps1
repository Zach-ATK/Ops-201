# Script Name:                  AutoConfig
# Author:                       Zachariah Woodbridge
# Date of latest revision:      06/11/2023
# Purpose:                      Ops Challenge: Class 11 - Automated Endpoint Configuration

# Declaration of variables

# Declaration of functions

# Main
# Note: Must be run with administrator privileges
# 1. Enable File and Printer Sharing
Set-NetFirewallRule -Name "File and Printer Sharing (SMB-In)" -Enabled True

# 2. Allow ICMP traffic (Ping)
Set-NetFirewallRule -Name "File and Printer Sharing (Echo Request - ICMPv4-In)" -Enabled True

# Enable Remote Management (WinRM)
Enable-PSRemoting

# List of bloatware apps to remove (you can customize this list)
$BloatwareApps = @(
    "App1",
    "App2",
    "App3"
)

foreach ($App in $BloatwareApps) {
    Get-AppxPackage -AllUsers | Where-Object DisplayName -eq $App | Remove-AppxPackage
}

# Enable Hyper-V feature
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V-All

# Disable SMBv1
Set-SmbServerConfiguration -EnableSMB1Protocol $false
Set-SmbClientConfiguration -EnableSMB1Protocol $false
Disable-WindowsOptionalFeature -Online -FeatureName SMB1Protocol

Write-Output "Configuration completed successfully.
#End
