from ignis import widgets
from ignis.window_manager import WindowManager

from .widgets import (
    Volume,
    Separator,
    Clock,
    Date,
    SystemTray,
    Workspaces,
    WindowTitle,
    Weather
)

WNDW_MNGR = WindowManager.get_default()


class Bar(widgets.Window):
    def __init__(self, monitor: int):
        super().__init__(
            anchor=["left", "top", "right"],
            css_classes=["bar"],
            exclusivity="exclusive",
            monitor=monitor,
            namespace=f"ignis_BAR{monitor}",
            child=widgets.CenterBox(
                start_widget=widgets.Box(
                    css_classes=["modules-left"],
                    child=[
                        Clock(),
                        Separator(),
                        Date(),
                        Separator(),
                        WindowTitle(),
                    ],
                ),
                center_widget=widgets.Box(
                    css_classes=["modules-center"],
                    child=[
                        Workspaces(),
                    ],
                ),
                end_widget=widgets.Box(
                    css_classes=["modules-right"],
                    child=[
                        SystemTray(),
                        Separator(),
                        Volume(),
                        Separator(),
                        Weather(),
                    ]
                )
            )
        )
