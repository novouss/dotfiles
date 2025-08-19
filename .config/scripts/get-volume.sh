#!/bin/bash
id=1113
step=5
timeout=1000
temp_file="$HOME/.cache/volume"

if [ -v temp_file ]; then
  touch $temp_file
fi

function get_volume {
  wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $2 * 100}'
}

function is_muted {
  muted=$(wpctl status | grep -i "MUTED")
  if [ -v muted ]; then
    return 0
  else
    return 1
  fi
}

function get_urgency {
  if [ "$1" -ge 10 ]; then
    echo "normal"
  else
    echo "critical"
  fi
}

function get_operation {
  case $1 in
    volume_up)
      wpctl set-volume @DEFAULT_AUDIO_SINK@ $step%+
      echo "Increased Volume"
      ;;
    volume_down)
      wpctl set-volume @DEFAULT_AUDIO_SINK@ $step%-
      echo "Decreased Volume"
      ;;
    volume_mute)
      # wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle


      echo "Volume Muted"
      ;;
    *)
      echo "Unknown operation"
      ;;
  esac
}

volume=$(get_volume)
operation=$(get_operation "$1")
urgency=$(get_urgency "$volume")

notify-send \
  --urgency=$urgency \
  --replace-id=$id \
  --app-name="$operation" \
  --expire-time=$timeout \
  --hint=int:value:$volume "$volume%"

