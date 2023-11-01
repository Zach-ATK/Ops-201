@echo off
REM This line turns off command echoing, making the script output cleaner.

setlocal enabledelayedexpansion
REM This enables delayed variable expansion, useful for using variables in loops or if blocks.

set /p sourcePath=Enter the source folder path:
REM This line prompts the user to enter the source folder path.

set /p destinationPath=Enter the destination folder path:
REM This line prompts the user to enter the destination folder path.

if not exist "!sourcePath!\" (
    REM Check if the source folder doesn't exist.
    echo Error: Source folder does not exist.
    goto :eof
    REM Display an error message and exit the script.
)

if not exist "!destinationPath!\" (
    REM Check if the destination folder doesn't exist.
    echo Error: Destination folder does not exist.
    goto :eof
    REM Display an error message and exit the script.
)

robocopy "!sourcePath!" "!destinationPath!" /E
REM Use Robocopy to copy files and directories from source to destination.

if errorlevel 8 (
    REM Check the error level returned by Robocopy.
    echo Error: ROBOCOPY encountered errors during the copy operation.
) else (
    echo Copy operation completed successfully.
    REM Display a success message.
)

:end
endlocal
REM Clean up and end the script.
