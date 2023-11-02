Rem 1: Output all events from the System event log that occurred in the last 24 hours to a file on your desktop named last_24.txt:
Get-WinEvent -LogName System -MaxEvents 200 -FilterHashtable @{LogName='System'; StartTime=(Get-Date).AddHours(-24)} | Format-List | Out-File "$env:USERPROFILE\Desktop\last_24.txt"

Rem 2: Output all "error" type events from the System event log to a file on your desktop named errors.txt:
Get-WinEvent -LogName System -MaxEvents 200 | Where-Object { $_.LevelDisplayName -eq 'Error' } | Format-List | Out-File "$env:USERPROFILE\Desktop\errors.txt"

Rem 3: Print to the screen all events with ID of 16 from the System event log:
Get-WinEvent -LogName System -MaxEvents 200 | Where-Object { $_.Id -eq 16 } | Format-Table -AutoSize

Rem 4: Print to the screen the most recent 20 entries from the System event log:
Get-WinEvent -LogName System -MaxEvents 20 | Format-Table -AutoSize

Rem 5: Print to the screen all sources of the 500 most recent entries in the System event log and ensure that the full lines are displayed:
Get-WinEvent -LogName System -MaxEvents 500 | Format-Table -AutoSize -Wrap
