#!/bin/bash

# Set paths for Fish and Zsh history
FISH_HISTORY_FILE="$HOME/.local/share/fish/fish_history"
ZSH_HISTORY_FILE="$HOME/.zsh_history"
TEMP_FILE="$HOME/fish_history_zsh_format.txt"

# Check if Fish history file exists
if [ ! -f "$FISH_HISTORY_FILE" ]; then
  echo "Fish history file not found."
  exit 1
fi

# Extract commands and timestamps from Fish history
awk '
  /- cmd:/ { cmd=$3 }
  /when:/ { print ": " $2 ":0;" cmd }
' "$FISH_HISTORY_FILE" > "$TEMP_FILE"

# Append Fish history to Zsh history
cat "$TEMP_FILE" >> "$ZSH_HISTORY_FILE"

# Reload Zsh history by setting HISTFILE
HISTFILE="$ZSH_HISTORY_FILE" zsh -c 'fc -R'

# Clean up temporary file
rm "$TEMP_FILE"

echo "Fish history merged into Zsh history successfully."