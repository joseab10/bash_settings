#! /bin/bash
# Script for installing my shell preferences

SETTINGS_DIR=~/etc
SCRIPT_DIR=$(dirname "$0")

echo Creating $SETTINGS_DIR
mkdir $SETTINGS_DIR

echo Installing files to $SETTINGS_DIR
cp -r "$SCRIPT_DIR" "$SETTINGS_DIR"

echo Adding source commands to ~/.bashrc
cd "$SCRIPT_DIR"
cat etc/bashrc >> ~/.bashrc

if hash conda 2>/dev/null; then
	echo "Setting Anaconda to not modify the shell's prompt"
	conda config --set changeps1 False
else
	echo Anaconda not found. Ignoring conda settings.
fi
