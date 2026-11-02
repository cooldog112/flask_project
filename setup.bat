
@echo off
chcp 65001 >nul

echo ==============================
echo AI Arduino 프로젝트 환경 설정
echo ==============================

REM 가상환경 생성
if not exist ".venv\Scripts\python.exe" (
    py -m venv .venv
)

REM 라이브러리 설치
.venv\Scripts\python.exe -m pip install -r requirements.txt

if errorlevel 1 (
    echo 라이브러리 설치 실패
    pause
    exit /b 1
)

echo.
echo 환경 설정 완료!
pause
