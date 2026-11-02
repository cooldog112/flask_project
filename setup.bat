@echo off
cd /d "%~dp0"

echo ==========================
echo AI Arduino Project Setup
echo ==========================

echo.
echo Creating virtual environment...

if not exist ".venv\Scripts\python.exe" (
    python -m venv .venv
)

if not exist ".venv\Scripts\python.exe" (
    echo Failed to create virtual environment.
    pause
    exit /b 1
)

echo.
echo Installing libraries...

".venv\Scripts\python.exe" -m pip install -r requirements.txt

if errorlevel 1 (
    echo Installation failed.
    pause
    exit /b 1
)

echo.
echo Setup completed successfully!

pause