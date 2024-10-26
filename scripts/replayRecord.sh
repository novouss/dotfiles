#!/bin/sh

pidof -q gpu-screen-recorder && exit 0
video_path="$HOME/Videos"
gpu-screen-recorder -w screen -f 60 -a default_output -c mp4 -r 120 -o "$video_path"
