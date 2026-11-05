#!/bin/bash

DEVICE_NAME=$(hostname | cut -d. -f1)
DESIRED_PATH='laptop-sync/backups'
STORAGE_FOLDER="$HOME/$DESIRED_PATH"

# Backup formulae
FORMULAE_FILE="$STORAGE_FOLDER/${DEVICE_NAME}_brew_formulae.txt"
brew list --formula > "$FORMULAE_FILE"
FORMULAE_COUNT=$(wc -l < "$FORMULAE_FILE")

# Backup casks
CASKS_FILE="$STORAGE_FOLDER/${DEVICE_NAME}_brew_casks.txt"
brew list --cask > "$CASKS_FILE"
CASKS_COUNT=$(wc -l < "$CASKS_FILE")

echo "Backup complete. Files saved to $STORAGE_FOLDER"
echo "Formulae backed up: $FORMULAE_COUNT"
echo "Casks backed up: $CASKS_COUNT"