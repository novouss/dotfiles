#!/bin/bash

source $HOME/dotfiles/.config/bemenu/config.sh
selected=$(printf "master\ndwindle\nscrolling" | bemenu ${BEMENU_OPTIONS[@]} -p "Layouts")

if [ -n "$selected" ]; then
  layout=$(echo "$selected" | awk '{print $1}')
  hyprctl keyword general:layout $layout
  dunstify --app-name="Switched Layouts!" "You are now in $layout."
fi
