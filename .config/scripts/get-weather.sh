#!/bin/bash

declare -A icons=(
  ["113"]="☀️" ["116"]="⛅️" ["119"]="☁️" ["122"]="☁️" ["143"]="🌫" ["176"]="🌦"
  ["179"]="🌧" ["182"]="🌧" ["185"]="🌧" ["200"]="⛈" ["227"]="🌨" ["230"]="❄️"
  ["248"]="🌫" ["260"]="🌫" ["263"]="🌦" ["266"]="🌦" ["281"]="🌧" ["284"]="🌧"
  ["293"]="🌦" ["296"]="🌦" ["299"]="🌧" ["302"]="🌧" ["305"]="🌧" ["308"]="🌧"
  ["311"]="🌧" ["314"]="🌧" ["317"]="🌧" ["320"]="🌨" ["323"]="🌨" ["326"]="🌨"
  ["329"]="❄️" ["332"]="❄️" ["335"]="❄️" ["338"]="❄️" ["350"]="🌧" ["353"]="🌦"
  ["356"]="🌧" ["359"]="🌧" ["362"]="🌧" ["365"]="🌧" ["368"]="🌨" ["371"]="❄️"
  ["374"]="🌧" ["377"]="🌧" ["386"]="⛈" ["389"]="🌩" ["392"]="⛈" ["395"]="❄️"
)

location=$(curl -s "https://ipinfo.io/json" | jq -r '.loc')
weatherData=$(curl -s "https://wttr.in/${locaiton}?format=j1")

code=$(echo "$weatherData" | jq -r '.current_condition[0].weatherCode')
description=$(echo "$weatherData" | jq -r '.current_condition[0].weatherDesc[0].value')
temperature=$(echo "$weatherData" | jq -r '.current_condition[0].FeelsLikeC')

icon=${icons[$code]}

echo "${icon} ${temperature}°C ${description}"
