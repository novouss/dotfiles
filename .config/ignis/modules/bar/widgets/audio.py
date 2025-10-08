from ignis import widgets
from ignis.services.audio import AudioService


AUDIO = AudioService.get_default()


class Volume(widgets.Box):
    def __init__(self):
        self._volume = AUDIO.speaker.bind(
            "volume",
            transform=lambda value: str(value)
        )
        self._is_muted = AUDIO.speaker.bind(
            "is_muted",
            transform=lambda value: print(value)
        )
        super().__init__(
            child=[
                widgets.Icon(
                    image=AUDIO.speaker.bind("icon_name"),
                    style="margin-right: 7px;"
                ),
                widgets.Label(label=self._volume)
            ]
        )

    def get_icon(self) -> str:
        return ""
