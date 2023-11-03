# Script Name:                  SysProc
# Author:                       Zachariah Woodbridge
# Date of latest revision:      03/11/2023
# Purpose:                      Ops Challenge - System Process Commands
#                               Do more Powershell commands, trying to prove that PowerShell is good. Even though I will drop it like it's hot as soon as possible.

# 1: Print to the terminal screen all active processes ordered by highest CPU time consumption at the top.
Get-Process | Sort-Object -Property CPU -Descending

# 2: Print to the terminal screen all active processes ordered by highest Process Identification Number at the top.
Get-Process | Sort-Object -Property ID -Descending

# 3: Print to the terminal screen the top five active processes ordered by highest Working Set (WS(K)) at the top.
Get-Process | Sort-Object -Property WorkingSet -Descending | Select-Object -First 5

# 4: Start a browser process (such as Google Chrome or MS Edge) and have it open https://owasp.org/www-project-top-ten/.
Start-Process "msedge.exe" "https://owasp.org/www-project-top-ten/"

#5: Start the process Notepad ten times using a for loop.
for ($i = 1; $i -le 10; $i++) {
    Start-Process "notepad.exe"
}

#6: Close all instances of the Notepad.
Get-Process | Where-Object { $_.ProcessName -eq "notepad" } | ForEach-Object { Stop-Process -Id $_.Id }

#7: Kill a process by its Process Identification Number. Choose a process whose termination won’t destabilize the system, such as Google Chrome or MS Edge.
Get-Process "msedge"
Stop-Process -Id <PID>
