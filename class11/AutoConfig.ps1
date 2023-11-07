# Script Name:                  AutoConfig
# Author:                       Zachariah Woodbridge
# Date of latest revision:      06/11/2023
# Purpose:                      Ops Challenge: Class 11 - Automated Endpoint Configuration

# Main
# Note: Must be run with administrator privileges
# 1. Enable File and Printer Sharing
Set-NetFirewallRule -DisplayName "File and Printer Sharing (SMB-In)" -Enabled True

# 2. Allow ICMP traffic (Ping)
netsh advfirewall firewall add rule name="ICMP" protocol=icmpv4:8,any dir=in action=allow
Set-NetFirewallRule -Name "File and Printer Sharing (Echo Request - ICMPv4-In)" -Action Allow #Block to block pings

# 3. Enable Remote Management (WinRM)
Enable-PSRemoting -force
Set-Item WSMan:\localhost\Client\TrustedHosts -Value "IP Address of Client"

# 4. Remove bloatware
iex ((New-Object System.Net.WebClient).DownloadString('https://git.io/debloat'))

# 5. Enable Hyper-V feature
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All

# 6. Disable SMBv1
Get-SmbServerConfiguration | Select EnableSMB1Protocol
Set-SmbServerConfiguration -EnableSMB1Protocol $false -force
Set-SmbVlientConfiguration -EnableSMB1Protocol $false -force
Get-WindowsOptionalFeature -Online -FeatureName SMB1Protocol
#End
