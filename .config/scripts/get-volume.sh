#!/bin/bash
step=5
timeout=1000

function get_volume {
  wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $2 * 100}'
}

operation=""

case $1 in
  volume_up)
    wpctl set-volume @DEFAULT_AUDIO_SINK@ $step%+
    operation="Increased Volume"
    ;;
  volume_down)
    wpctl set-volume @DEFAULT_AUDIO_SINK@ $step%-
    operation="Decreased Volume"
    ;;
  volume_mute)
    wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
    operation="Volume Muted"
    ;;
esac

volume=$(get_volume)

if [ $1 == volume_mute ]; then
  notify-send --urgency=critical --replace-id=1113 --expire-time=$timeout --app-name="$operation" --hint=int:value:0 "0%"
else
  notify-send --replace-id=1113 --expire-time=$timeout --app-name="$operation" --hint=int:value:$volume "$volume%"
fi
