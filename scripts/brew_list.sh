#!/bin/bash
DEVICE_NAME=$(hostname | cut -d. -f1)
GIT_MAIL=$(git config --global user.email)
CLOUD_STORAGE='GoogleDrive'
DESIRED_PATH='My Drive/Programs'
CLOUD_STORAGE_FOLDER="$HOME/Library/CloudStorage/$CLOUD_STORAGE-$GIT_MAIL/$DESIRED_PATH"
brew list >"$CLOUD_STORAGE_FOLDER/${DEVICE_NAME}_brew.txt"
