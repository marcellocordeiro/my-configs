@echo off

if "%~1"=="" (
    echo No argument provided. Drag a file onto this script.
    pause
    exit /b
)

echo Current path: "%~dp0"
echo Dragged file path: "%~1"
echo Dragged file name: "%~nx1"

powershell -Command "Start-Process powershell -ArgumentList '-NoProfile -ExecutionPolicy Bypass -NoExit -File \"%~1\"'"

pause
