#!/bin/sh

pactl load-module module-echo-cancel
pactl set-default-source echo-cancel-source

pidof -q gpu-screen-recorder && exit 0
video_path="$HOME/Videos/Replays"
gpu-screen-recorder -w screen -f 60 -a "$(pactl get-default-sink).monitor|$(pactl get-default-source)" -c mp4 -r 120 -o "$video_path"
