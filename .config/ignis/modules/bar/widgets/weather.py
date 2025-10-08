import json
from pathlib import Path
import subprocess


from ignis import widgets
from ignis import utils


class Weather(widgets.Label):
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

    def get_request(self, url: str) -> str | None:
        curl_proc = subprocess.run(
            ['curl', '-s', url],
            capture_output=True,
            check=True,
            text=True
        )
        return curl_proc.stdout

    def get_location(self):
        location = "auto"
        try:
            raw = self.get_request("https://ipinfo.io/json")
            if not raw:
                raise ValueError("No location data returned")

            location = json.loads(raw).get('loc', 'auto')
            if location != "auto":
                self.DATA.parent.mkdir(parents=True, exist_ok=True)
                self.DATA.write_text(location)
        except Exception:
            pass

        return location

    def get_weather(self) -> str:
        if self.DATA.is_file():
            location = self.DATA.read_text().strip()
        else:
            location = self.get_location()

        try:
            raw = self.get_request(f"https://wttr.in/{location}?format=j1")
            if not raw:
                raise ValueError("No weather data returned.")
            weather = json.loads(raw)["current_condition"][0]

            self._code = weather["weatherCode"]
            self._description = weather["weatherDesc"][0]["value"]
            self._temperature = weather["FeelsLikeC"]
            self._icon = self.ICONS.get(self._code, "?")
            return f"{self._icon} {self._temperature}°C {self._description}"
        except Exception as e:
            return f"⁉️ {e}"

    def __init__(self):
        self._code = ""
        self._description = ""
        self._temperature = ""
        self._icon = ""

        super().__init__(
            label=utils.Poll(
                3_600_000,
                lambda _: self.get_weather()
            ).bind("output")
        )

    def get_icon(self) -> str:
        return self._icon
