#!/bin/bash

# Javad Theme Installer
# Installs the theme to /usr/share/sddm/themes/javad-theme

THEME_NAME="javad-theme"
SOURCE_DIR="$(pwd)/$THEME_NAME"
TARGET_DIR="/usr/share/sddm/themes/$THEME_NAME"

# Check if running as root
if [ "$EUID" -ne 0 ]; then 
  echo "Please run as root (sudo ./install.sh)"
  exit 1
fi

echo "Installing $THEME_NAME..."

# Remove existing installation
if [ -d "$TARGET_DIR" ]; then
    echo "Removing existing theme at $TARGET_DIR..."
    rm -rf "$TARGET_DIR"
fi

# Copy new theme
if [ -d "$SOURCE_DIR" ]; then
    echo "Copying theme to $TARGET_DIR..."
    cp -r "$SOURCE_DIR" "$TARGET_DIR"
    echo "Done!"
    
    echo "To test the theme, run:"
    echo "sddm-greeter --test-mode --theme $TARGET_DIR"
else
    echo "Error: Source directory $SOURCE_DIR not found."
    exit 1
fi
