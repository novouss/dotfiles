#!/bin/bash

source $HOME/dotfiles/.config/bemenu/config.sh
file="$HOME/dotfiles/.config/bemenu/emojis.txt"
selected=$(cat "$file" | bemenu ${BEMENU_OPTIONS[@]} -p "Emojis" ) 
if [ -n "$selected" ]; then
  emoji=$(echo "$selected" | awk '{print $1}')
  echo -n $emoji | wl-copy
  dunstify --app-name="Emoji Copied!" "$emoji has been copied to your clipboard."
fi
