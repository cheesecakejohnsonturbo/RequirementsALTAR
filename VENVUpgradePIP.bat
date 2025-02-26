@echo off
setlocal enabledelayedexpansion

set "venv_path=%~dp0..\ComfyUI\venv\Scripts\"
set "activate_script=%venv_path%activate.bat"
set "deactivate_script=%venv_path%deactivate.bat"
set "venv_python=%venv_path%python.exe"

if not exist "%venv_path%" (
    echo It broke, Brams! Virtual environment not found.
    pause
    exit /b 1
)

if not exist "%activate_script%" (
    echo It broke, Brams! Activate script not found.
    pause
    exit /b 1
)

if not exist "%deactivate_script%" (
    echo It broke, Brams! Deactivate script not found.
    pause
    exit /b 1
)

call "%activate_script%"

 %venv_python% -m pip install --upgrade pip
 
call "%deactivate_script%"

pause
endlocal
exit /b 0