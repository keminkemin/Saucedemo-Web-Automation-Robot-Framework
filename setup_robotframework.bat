@echo off
echo Setting up Robot Framework environment...

REM Step 1: Install Python (Assuming Python installer is in the same directory)
echo Installing Python...
start /wait python-3.12.3-amd64.exe /quiet InstallAllUsers=1 PrependPath=1

REM Step 2: Upgrade pip (Python Package Installer)
echo Upgrading pip...
python -m pip install --upgrade pip

REM Step 3: Install Robot Framework
echo Installing Robot Framework...
pip install robotframework

REM Step 4: Install libraries for web and API testing
echo Installing Libraries...
pip install robotframework-seleniumlibrary
pip install robotframework-jsonlibrary
pip install robotframework-pythonlibcore
pip install robotframework-requests
pip install robotframework-seleniumlibrary

REM Step 5: Download and install ChromeDriver (if not already installed)
echo Downloading ChromeDriver...
curl -O https://storage.googleapis.com/chrome-for-testing-public/128.0.6613.86/win64/chromedriver-win64.zip
echo Extracting ChromeDriver...
tar -xf chromedriver-win64.zip
echo Adding ChromeDriver to PATH...
setx PATH "%PATH%;%cd%"

REM Cleanup downloaded files
echo Cleaning up...
del chromedriver_win32.zip

echo Installation complete!

REM Verify installations
echo Verifying installations...
python --version
pip --version
robot --version
chromedriver --version

echo Setup complete. You can now run your Robot Framework tests.

pause