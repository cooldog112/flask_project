@echo off

echo ==============================
echo Arduino COM Port Check
echo ==============================
echo.

powershell -NoProfile -Command "Get-CimInstance Win32_PnPEntity | Where-Object { $_.Name -match '\(COM[0-9]+\)' } | Select-Object Name, DeviceID | Format-Table -AutoSize"

echo.
pause
