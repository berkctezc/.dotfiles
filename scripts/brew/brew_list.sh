#!/bin/bash

DEVICE_NAME=$(hostname | cut -d. -f1)
GIT_MAIL=$(git config --global user.email)
CLOUD_STORAGE='GoogleDrive'
DESIRED_PATH='My Drive/Programs'
CLOUD_STORAGE_FOLDER="$HOME/Library/CloudStorage/$CLOUD_STORAGE-$GIT_MAIL/$DESIRED_PATH"

# Backup formulae
FORMULAE_FILE="$CLOUD_STORAGE_FOLDER/${DEVICE_NAME}_brew_formulae.txt"
brew list --formula > "$FORMULAE_FILE"
FORMULAE_COUNT=$(wc -l < "$FORMULAE_FILE")

# Backup casks
CASKS_FILE="$CLOUD_STORAGE_FOLDER/${DEVICE_NAME}_brew_casks.txt"
brew list --cask > "$CASKS_FILE"
CASKS_COUNT=$(wc -l < "$CASKS_FILE")

echo "Backup complete. Files saved to $CLOUD_STORAGE_FOLDER"
echo "Formulae backed up: $FORMULAE_COUNT"
echo "Casks backed up: $CASKS_COUNT"