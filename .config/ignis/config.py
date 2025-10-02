import os
import datetime

from ignis.widgets import Widget
from ignis.utils import Utils

# from ignis.css_manager import CssManager, CssInfoPath

from ignis.app import IgnisApp

from ignis.services.audio import AudioService
from ignis.services.hyprland import HyprlandService, HyprlandWorkspace
from ignis.services.system_tray import SystemTrayService, SystemTrayItem

from scripts import get_weather

# css_manager = CssManager.get_default()
#
# css_manager.apply_css(
#     CssInfoPath(
#         name="main",
#         compiler_function=lambda path: Utils.sass_compile(path=path),
#         path=os.path.join(Utils.get_current_dir(), "style.scss"),
#     )
# )

app = IgnisApp.get_default()
app.apply_css(os.path.expanduser("~/dotfiles/.config/ignis/style.scss"))

audio = AudioService.get_default()
hyprland = HyprlandService.get_default()
systemtray = SystemTrayService.get_default()


def workspace_button(workspace: HyprlandWorkspace) -> Widget.Button:
    widget = Widget.Button(
        css_classes=["workspace-button"],
        on_click=lambda _: workspace.switch_to(),
        child=Widget.Label(label=str(workspace.id)),
    )
    if workspace.id == hyprland.active_workspace.id:
        widget.add_css_class("active")
    else:
        widget.add_css_class("inactive")
    return widget


def workspaces() -> Widget.EventBox:
    return Widget.EventBox(
        css_classes=["workspaces"],
        spacing=5,
        child=hyprland.bind_many(
            ["workspaces", "active_workspace"],
            transform=lambda workspaces, _: [
                workspace_button(i) for i in workspaces
            ]
        )
    )


def client_title() -> Widget.Label:
    return Widget.Label(
        css_classes=["active-title"],
        ellipsize="end",
        max_width_chars=40,
        label=hyprland.active_window.bind("title"),
    )


def datetime_format(frmt: str) -> str:
    return datetime.datetime.now().strftime(frmt)


def clock() -> Widget.Label:
    return Widget.Label(
        label=Utils.Poll(
            1000,
            lambda _: datetime_format("  %I:%M %p")
        ).bind("output")
    )


def calendar() -> Widget.Label:
    return Widget.Label(
        label=Utils.Poll(
            3600000,
            lambda _: datetime_format("  %a %e")
        ).bind("output")
    )


def separator() -> Widget.Separator:
    return Widget.Separator(
        vertical=True,
        css_classes=["middle-separator"]
    )


def volume() -> Widget.Box:
    return Widget.Box(
        child=[
            Widget.Icon(
                image=audio.speaker.bind("icon_name"),
                style="margin-right: 5px;"
            ),
            Widget.Label(
                label=audio.speaker.bind(
                    "volume",
                    transform=lambda value: str(value)
                )
            )
        ]
    )


def tray_item(item: SystemTrayItem) -> Widget.Button:
    if item.menu:
        menu = item.menu.copy()
    else:
        menu = None
    return Widget.Button(
        child=Widget.Box(
            child=[
                Widget.Icon(
                    image=item.bind("icon"),
                    pixel_size=18
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


def tray():
    return Widget.Box(
        setup=lambda self: systemtray.connect(
            "added", lambda _, item: self.append(tray_item(item))
        ),
        spacing=10,
    )


def weather() -> Widget.Label:
    return Widget.Label(
        label=Utils.Poll(
            3_600_000,
            lambda _: get_weather()
        ).bind("output")
    )


def modules_left() -> Widget.Box:
    return Widget.Box(
        css_classes=["modules-left"],
        child=[
            clock(),
            separator(),
            calendar(),
            separator(),
            client_title(),
        ],
    )


def modules_center() -> Widget.Box:
    return Widget.Box(
        child=[
            workspaces(),
        ],
    )


def modules_right() -> Widget.Box:
    return Widget.Box(
        css_classes=["modules-right"],
        child=[
            tray(),
            separator(),
            volume(),
            separator(),
            weather(),
        ]
    )


def bar(monitor_id: int = 0) -> Widget.Window:
    return Widget.Window(
        namespace=f"ignis_bar_{monitor_id}",
        css_classes=["bar"],
        monitor=monitor_id,
        anchor=["left", "top", "right"],
        exclusivity="exclusive",
        child=Widget.CenterBox(
            start_widget=modules_left(),
            center_widget=modules_center(),
            end_widget=modules_right()
        )
    )


for i in range(Utils.get_n_monitors()):
    bar(i)
