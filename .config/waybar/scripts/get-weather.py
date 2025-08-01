
import json
import requests

icons = {
  "113": "☀️",
  "116": "⛅️",
  "119": "☁️",
  "122": "☁️",
  "143": "🌫",
  "176": "🌦",
  "179": "🌧",
  "182": "🌧",
  "185": "🌧",
  "200": "⛈",
  "227": "🌨",
  "230": "❄️",
  "248": "🌫",
  "260": "🌫",
  "263": "🌦",
  "266": "🌦",
  "281": "🌧",
  "284": "🌧",
  "293": "🌦",
  "296": "🌦",
  "299": "🌧",
  "302": "🌧",
  "305": "🌧",
  "308": "🌧",
  "311": "🌧",
  "314": "🌧",
  "317": "🌧",
  "320": "🌨",
  "323": "🌨",
  "326": "🌨",
  "329": "❄️",
  "332": "❄️",
  "335": "❄️",
  "338": "❄️",
  "350": "🌧",
  "353": "🌦",
  "356": "🌧",
  "359": "🌧",
  "362": "🌧",
  "365": "🌧",
  "368": "🌨",
  "371": "❄️",
  "374": "🌧",
  "377": "🌧",
  "386": "⛈",
  "389": "🌩",
  "392": "⛈",
  "395": "❄️",
}

location = requests.get("https://ipinfo.io/json").json()["loc"]
weather = requests.get(f"https://wttr.in/{location}?format=j1").json()
current = weather["current_condition"][0]
code = current["weatherCode"]
description = current["weatherDesc"][0]["value"]
temp = f"{current["FeelsLikeC"]}°C"
icon = icons[code]

print(f'{icon} {temp} {description}')
