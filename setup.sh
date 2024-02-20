#! /bin/bash
# Script for installing my shell preferences

SETTINGS_DIR=~/etc
SCRIPT_DIR=$(dirname "$0")
TERM_PROFILE=~/.bashrc

#printf "\nCreating $SETTINGS_DIR"
#if [ -d "$SETTINGS_DIR" ]; then
	#printf "$SETTINGS_DIR exists. Skipping"
#mkdir $SETTINGS_DIR

printf "\nInstalling files to $SETTINGS_DIR\n"
rsync -av "$SCRIPT_DIR" "$SETTINGS_DIR" --exclude .git

printf "\nAdding source command to $TERM_PROFILE\n"
SRC_CMD="source ${SETTINGS_DIR}/etc/bashrc"
if grep -q "${SRC_CMD[@]}" "$TERM_PROFILE" ; then
	printf "Source command already in $TERM_PROFILE. Skipping.\n"
else
	echo "# JAB Preferences" >> $TERM_PROFILE
	echo "source ${SETTINGS_DIR}/etc/bashrc" >> $TERM_PROFILE
	echo >> $TERM_PROFILE
fi

printf "\nSetting Anaconda to not modify the shell's prompt\n"
if hash conda 2>/dev/null; then
	conda config --set changeps1 False
else
	printf "Anaconda not found. Skipping.\n"
fi

printf "\nSourcing .bashrc profile for changes to take effect."
source ~/.bashrc
