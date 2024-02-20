#! /bin/bash
# Script for installing my shell preferences

SETTINGS_DIR = ~/etc

mkdir $SETTINGS_DIR

cd "$(dirname "$0")"

cp git-completion.bash $SETTINGS_DIR
cp git-prompt.sh       $SETTINGS_DIR
cp prompt_jab.sh       $SETTINGS_DIR
cp alias_jab.sh        $SETTINGS_DIR
cp env_jab.sh          $SETTINGS_DIR
cp func_jab.sh         $SETTINGS_DIR

cat bashrc >> ~/.bashrc
