from ignis import widgets
from ignis.window_manager import WindowManager


WNDW_MNGR = WindowManager.get_default()


class QuickIcons(widgets.Button):
    def __init__(self, icons: list[str]):
        super().__init__(
            css_classes=["workspaces"],
            halign="start",
            valign="center",
            on_click=lambda _: WNDW_MNGR.toggle_window("ignis_qs"),
            child=widgets.Box(
                child=[widgets.Label(label=icon) for icon in icons],
                spacing=20,
                style="margin-right: 5px;",
            ),
        )
