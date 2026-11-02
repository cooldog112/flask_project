@echo off
chcp 65001 >nul

echo ==============================
echo Arduino COM 포트 확인
echo ==============================

powershell -NoProfile -Command "Get-CimInstance Win32_PnPEntity | Where-Object { $_.Name -match '\(COM[0-9]+\)' } | Select-Object Name, DeviceID | Format-Table -AutoSize"

echo.
pause