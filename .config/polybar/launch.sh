#!/usr/bin bash

# Terminates all running instances of Polybar
killall -q polybar

# Ensure all polybar processes have been shutdown, wait unti then.
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

polybar -c $HOME/dotfiles/polybar/config bar &
