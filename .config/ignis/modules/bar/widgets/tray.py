from ignis import widgets
from ignis.services.system_tray import SystemTrayService, SystemTrayItem


SYSTEM_TRAY = SystemTrayService.get_default()


class TrayItem(widgets.Button):
    def __init__(self, item: SystemTrayItem):
        if item.menu:
            menu = item.menu.copy()
        else:
            menu = None
        super().__init__(
            child=widgets.Box(
                child=[
                    widgets.Icon(
                        image=item.bind("icon"),
                        pixel_size=15,
                    ),
                    menu,
                ]
            ),
            setup=lambda self: item.connect("removed", lambda x: self.unparent()),
            tooltip_text=item.bind("tooltip"),
            on_click=lambda _: menu.popup() if menu else None,
            on_right_click=lambda _: menu.popup() if menu else None,
            css_classes=["tray-item", "unset"],
        )


class SystemTray(widgets.Box):
    def __init__(self):
        super().__init__(
            setup=lambda self: SYSTEM_TRAY.connect(
                "added",
                lambda _, item: self.append(TrayItem(item))
            ),
            spacing=10
        )
