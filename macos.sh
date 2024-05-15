#!/bin/bash

# Set variables
APP_DIR="HaiVE-AI-Studio"
DOWNLOAD_URL="https://public-download.mum-objectstore.e2enetworks.net/macos.zip"
DOWNLOAD_PATH="$HOME/Downloads/temp"
USER_DIRECTORY="$HOME"
EXE_FILE="$HOME/$APP_DIR/executables/zrok.exe"

# Disabling zrok
if [ -f "$EXE_FILE" ]; then
  if [ -d "$USER_DIRECTORY/.zrok" ]; then
    echo "Disabling zrok..."
    "$EXE_FILE" disable
    echo "Zrok disabled."
  else
    echo ".zrok folder not found."
  fi
else
  echo "Zrok not found."
fi

echo

# Deleting .zrok folder
if [ -d "$USER_DIRECTORY/.zrok" ]; then
  echo "Deleting .zrok folder..."
  rm -rf "$USER_DIRECTORY/.zrok"
  echo ".zrok deleted."
else
  echo ".zrok not found."
fi

echo

# Delete the folder if it exists
if [ -d "$USER_DIRECTORY/$APP_DIR" ]; then
  echo "Deleting folder..."
  rm -rf "$USER_DIRECTORY/$APP_DIR"
  echo "Folder deleted."
else
  echo "Folder does not exist."
fi

echo

# Create download folder if it doesn't exist
mkdir -p "$DOWNLOAD_PATH"

echo

# Download the zip file
echo "Downloading zip file..."
curl -o "$DOWNLOAD_PATH/windows.zip" "$DOWNLOAD_URL"

echo

# Unzip the file
echo "Unzipping file..."
unzip -o "$DOWNLOAD_PATH/windows.zip" -d "$USER_DIRECTORY"

echo

# Deleting zip the file
echo "Deleting zip file..."
rm -rf "$DOWNLOAD_PATH"

echo

echo "Process completed."

read -p "Press Enter to exit."
