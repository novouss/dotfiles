import json
from pathlib import Path
import subprocess

ICONS = {
    "113": "☀️", "116": "⛅️", "119": "☁️", "122": "☁️", "143": "🌫", "176": "🌦",
    "179": "🌧", "182": "🌧", "185": "🌧", "200": "⛈", "227": "🌨", "230": "❄️",
    "248": "🌫", "260": "🌫", "263": "🌦", "266": "🌦", "281": "🌧", "284": "🌧",
    "293": "🌦", "296": "🌦", "299": "🌧", "302": "🌧", "305": "🌧", "308": "🌧",
    "311": "🌧", "314": "🌧", "317": "🌧", "320": "🌨", "323": "🌨", "326": "🌨",
    "329": "❄️", "332": "❄️", "335": "❄️", "338": "❄️", "350": "🌧", "353": "🌦",
    "356": "🌧", "359": "🌧", "362": "🌧", "365": "🌧", "368": "🌨", "371": "❄️",
    "374": "🌧", "377": "🌧", "386": "⛈", "389": "🌩", "392": "⛈", "395": "❄️"
}

DATA = Path.home() / ".local" / "location"


def get_request(url: str) -> str | None:
    curl_proc = subprocess.run(['curl', '-s', url], capture_output=True, check=True, text=True)
    return curl_proc.stdout


def get_location():
    location = "auto"
    try:
        raw = get_request("https://ipinfo.io/json")
        if not raw:
            raise ValueError("No location data returned")

        location = json.loads(raw).get('loc', 'auto')
        if location != "auto":
            DATA.parent.mkdir(parents=True, exist_ok=True)
            DATA.write_text(location)
    except Exception:
        pass

    return location


def get_weather() -> str:
    if DATA.is_file():
        location = DATA.read_text().strip()
    else:
        location = get_location()

    try:
        raw = get_request(f"https://wttr.in/{location}?format=j1")
        if not raw:
            raise ValueError("No weather data returned.")
        weather = json.loads(raw)["current_condition"][0]

        code = weather["weatherCode"]
        description = weather["weatherDesc"][0]["value"]
        temperature = weather["FeelsLikeC"]
        icon = ICONS.get(code, "?")
        return f"{icon} {temperature}°C {description}"
    except Exception:
        return "⁉️ ERROR"
