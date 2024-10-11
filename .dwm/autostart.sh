#!/bin/sh

# Removes mouse accel
xinput --set-prop 'pointer:''Beken 2.4G Wireless Device' 'libinput Accel Profile Enabled' 0 1
xinput --set-prop 'pointer:''Beken 2.4G Wireless Device' 'libinput Accel Speed' 0

# Adds background
feh --bg-fill $HOME/Pictures/castlevania-wallpaper.png &

# Makes consoles transparent
picom --config $HOME/.config/picom/picom.conf &

# Enable Polybar
killall -q polybar
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
polybar -c $HOME/.config/polybar/config.ini main &

# Extends monitor to the right
# xrandr --output HDMI-1 --auto --right-of eDP-1 &
