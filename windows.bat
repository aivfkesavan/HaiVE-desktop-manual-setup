@echo off

REM Set variables
set APP_DIR=HaiVE-AI-Studio
set DOWNLOAD_URL=http://localhost:5000/windows.zip
set DOWNLOAD_PATH=%USERPROFILE%\Downloads\temp
set USER_DIRECTORY=%USERPROFILE%
set EXE_FILE="%USERPROFILE%"\"%APP_DIR%"\executables\zrok.exe

REM Disabling zrok
if exist "%EXE_FILE%" (
  if exist "%USER_DIRECTORY%"\"%APP_DIR%" (
    echo Disabling zrok...
    start /wait "" "%EXE_FILE%" disable
    echo Zrok disabled.
  ) else (
    echo .zrok folder not found.
  )
) else (
  echo Zrok not found.
)

echo.
REM Deleting .zrok folder
if exist "%USER_DIRECTORY%"\.zrok (
  echo Deleting .zrok folder...
  rmdir /s /q "%USER_DIRECTORY%"\.zrok
  echo .zrok deleted.
) else (
  echo .zrok not found.
)

echo.
REM Delete the folder if it exists
if exist "%USER_DIRECTORY%"\"%APP_DIR%" (
  echo Deleting folder...
  rmdir /s /q "%USER_DIRECTORY%"\"%APP_DIR%"
  echo Folder deleted.
) else (
  echo Folder does not exist.
)

echo.
REM Create download folder if it doesn't exist
if not exist "%DOWNLOAD_PATH%" mkdir "%DOWNLOAD_PATH%"

echo.
REM Create unzip folder if it doesn't exist
if not exist "%UNZIP_PATH%" mkdir "%UNZIP_PATH%"

echo.
REM Download the zip file
echo Downloading zip file...
curl -o "%DOWNLOAD_PATH%\windows.zip" "%DOWNLOAD_URL%"

echo.
REM Unzip the file
echo Unzipping file...
powershell -Command "Expand-Archive -Path '%DOWNLOAD_PATH%\windows.zip' -DestinationPath '%USER_DIRECTORY%' -Force"

echo.
REM deleting zip the file
echo Deleting zip file...
rmdir /s /q "%DOWNLOAD_PATH%"

echo.
echo Process completed.

pause