@echo off
REM python setup wrapper

IF "%1"=="py" IF "%2"=="up" (
python --version >nul 2>&1
IF ERRORLEVEL 1 (
echo "Python not found, download from https://www.python.org/downloads/"
pause
exit /b
)
python -m ensurepip --upgrade
python -m pip install --upgrade pip
python -m venv venv
echo "Done py up"
exit /b
)

IF "%1"=="env" IF "%2"=="on" (
IF NOT EXIST venv\Scripts\activate.bat (
echo "venv not found, create with py up first"
exit /b
)
call venv\Scripts\activate.bat
echo "env activated"
exit /b
) ELSE IF "%1"=="env" IF "%2"=="off" (
call venv\Scripts\deactivate.bat
echo "env deactivated"
exit /b
)

IF "%1"=="pip" IF "%2"=="up" (
python -m pip install --upgrade pip
echo "pip upgraded"
exit /b
)

IF "%1"=="pip" (
IF EXIST venv (
python -m pip install %2
echo "added %2 to env"
exit /b
) ELSE (
echo "no env active, run env on first"
exit /b
)
)

echo "usage: py up ^| pip up ^| pip <module> ^| env on/off"
