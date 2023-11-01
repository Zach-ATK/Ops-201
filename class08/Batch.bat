REM This line turns off command echoing, making the script commands invisible from terminal.
@echo off
REM This enables delayed variable expansion, helpful in using variables in loops or if blocks.
setlocal enabledelayedexpansion

REM This prompts the user to enter the source folder path and presses enter.
set /p sourcePath=Enter the source folder path:

REM This prompts the user to enter the destination folder path and presses enter.
set /p destinationPath=Enter the destination folder path:

REM Checks to see  if the source folder DOESN'T exist using if/goto. Goes through sequentially.
if not exist "!sourcePath!\" (
    REM displays "Error: Source folder does not exist"
    echo Error: Source folder does not exist.
    REM Exits the script. End of File
    goto :eof
)

REM Checks if the destination folder DOESN'T exist using if/goto. Goes through sequentially.
if not exist "!destinationPath!\" (
    REM displays "Error: Destination folder does not exist"
    echo Error: Destination folder does not exist.
    REM Exits the script. End of File   
    goto :eof
)

REM Use Robocopy to copy files and directories from source to destination.
robocopy "!sourcePath!" "!destinationPath!" /E
REM Checks the error level returned by Robocopy using if/else. Goes through sequentially.
if errorlevel 8 (
    REM Displays "Error: ROBOCOPY encountered errors during the copy operation."
    echo Error: ROBOCOPY encountered errors during the copy operation.
REM Proceeds to this step if the first wasn't true.
) else (
    REM Display a success message:"Copy operation completed successfully."
    echo Copy operation completed successfully.   
)
REM Clean up and end the script.
:end
REM ends localization of env. variables.
endlocal
