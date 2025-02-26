@echo off
setlocal enabledelayedexpansion
::Intro::Contextualisation::
echo DisclaimerLine1: All resemblence with the videogame "Encryptions" is absolutely not coincidental
echo DisclaimerLine2: Think about the poor creatures. Save a creature card. Put a dummy requirements.txt instead.
echo Brams had a son. His son had a pet lamb and it was his favorite pet.
echo Brams wanted to make an omen to USER.
echo but his son was mad at him because he liked his pet so much.
echo Luckily, USER provided him with a substitute omen called requirements.txt .
echo Requirements.txt was an omen of quality which made Brams confident in the outcomes of the ritual.
echo When Brams completed the omen, his VENV contained all the extra PIP packages he needed for his environment.
echo USER should always provide Brams with a fresh copy of requirements.txt to preserve the original.
echo When the ALTAR is properly prepared, Requirments will be installed in the virtual environment.
::Paths::
set "venv_path=%~dp0..\ComfyUI\venv\Scripts\"
set "activate_script=%venv_path%activate.bat"
set "deactivate_script=%venv_path%deactivate.bat"
set "venv_python=%venv_path%python.exe"
::step1::Check if venv is installed
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
echo The ALTAR is properly prepared and can process the omen.
::step2::Chosing the next step::
:menu::navigate through bookmarks here
echo.
echo Be careful, destiny is at hand:
echo 1. Proceed with installation
echo 2. Update pip
echo 3. Leave the ALTAR
echo.
set /p choice="Select your next action"


if "%choice%"=="1" goto :proceed
if "%choice%"=="2" goto :update_pip
if "%choice%"=="3" goto :end

::Step3::
:proceed ::install requirements.txt in the VENV using local venv python
echo Looking for omen in requirements.txt to perform the PIP package installation in your venv
IF NOT EXIST "%~dp0\requirements.txt" (
  echo  "WHAT HAVE YOU DONE!? There is no Requirements.txt on the ALTAR!" -Brams
  echo You are required to place it at "%~dp0".
  echo You've been warned! The ritual cannot proceed. Press a key to leave the altar.
  echo ...
  echo Press a key to leave the altar.
  goto :requirements_not_met
)

echo Requirements found. Press a key to proceed to the next step.
::pause >nul

::step4::Checking if the file contains anything::
for /f %%a in ('type "%~dp0\requirements.txt" ^| find /v /c ""') do set line_count=%%a
if %line_count% == 0 (
  echo Brams might be old, but he still can read. "This file is empty!" retorted the wise old man.
  goto :requirements_not_met
)
echo Brams verified that the omen is not empty and can confirm it has content thought his reading isn't clear anymore.
echo "That seems like a proper omen."
pause >nul
goto :requirements_found
::step5::Activate, pip install requirements, deactivate::
:requirements_found::install requirements
call "%activate_script%"
 %venv_python% -m pip install -r "%~dp0requirements.txt" 
call "%deactivate_script%"
rem goto :install_successful
::step6::DELETE requirements.txt
goto :del_menu


:update_pip
call "%activate_script%"

 %venv_python% -m pip install --upgrade pip
 
call "%deactivate_script%"
goto :pip_upgrade_sucessful

:requirements_not_met::
echo The ritual cannot proceed.
echo ~~MENU~~
echo Press 1 to return to the main menu
echo Press 2 to leave the altar
set /p choice="Select your next action"
if "%choice%"=="1" goto :menu
if "%choice%"=="2" goto :error_exit
echo Invalid choice. Please try again.
pause
goto :requirements_not_met
:install_successful::
echo The ritual completed successfully.
echo ~~MENU~~
echo Press 1 to return to the main menu
echo Press 2 to leave the altar
set /p choice="Select your next action"
if "%choice%"=="1" goto :menu
if "%choice%"=="2" goto :success_exit
echo Invalid choice. Please try again.
pause
goto :install_successful
:pip_upgrade_sucessful::
echo PIP upgrade completed.
echo ~~MENU~~
echo Press 1 to return to the main menu
echo Press 2 to leave the altar
set /p choice="Select your next action"
if "%choice%"=="1" goto :menu
if "%choice%"=="2" goto :success_exit
echo Invalid choice. Please try again.
pause
goto :pip_upgrade_successful
:deletion_sucessful::
echo PIP upgrade completed.
echo ~~MENU~~
echo Press 1 to return to the main menu
echo Press 2 to leave the altar
set /p choice="Select your next action"
if "%choice%"=="1" goto :menu
if "%choice%"=="2" goto :success_exit
echo Invalid choice. Please try again.
pause
goto :deletion_sucessful
:success_exit
REM Finalizing and cleaning
endlocal
echo Everybody is pleased. Brams went back home with his son, his lamb, and newly installed requirements.
ECHO Press a key when you are ready to leave the altar.
pause >nul
exit /b 0
:error_exit
REM Aborting and cleaning
endlocal
echo Sacrifice aborted. Brams returned home but couldn't benefit from the installed requirements. His son and his lamb both were unhappy but nonetheless preserved a bit of hope that requirements would be fulfilled for the ALTAR to complete VENV dependencies deployment.
echo The user is welcomed to review the commandline before pressing a key to leave the altar, says Brams.
pause >nul
exit /b 1
:exit
pause
endlocal
exit /b 0
:del_menu::
echo The time have come!
echo ~~MENU~~
echo press 1 to delete requirements.txt and exit
echo Press 2 to return to the main menu
echo Press 3 to leave the altar
set /p choice="Select your next action"
if "%choice%"=="1" goto :del_requirements_file
if "%choice%"=="2" goto :menu
if "%choice%"=="3" goto :success_exit
echo Invalid choice. Please try again.
pause
goto :del_menu
:del_requirements_file
echo Requirements.txt has, hopefully, been deleted as intended.
DEL "%~dp0requirements.txt"
goto :success_exit
::Beyond is void
