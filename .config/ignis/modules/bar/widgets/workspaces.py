from ignis import widgets
from ignis.services.hyprland import HyprlandService, HyprlandWorkspace


HYPRLAND = HyprlandService.get_default()


class WorkspaceButton(widgets.Button):
    def __init__(self, workspace: HyprlandWorkspace):
        super().__init__(
            css_classes=["workspace-button"],
            halign="start",
            valign="center",
            on_click=lambda _: workspace.switch_to(),
            # child=widgets.Label(label=str(workspace.id)),
        )
        if workspace.id == HYPRLAND.active_workspace.id:
            self.add_css_class("active")
        else:
            self.add_css_class("inactive")


class Workspaces(widgets.EventBox):
    def __init__(self):
        super().__init__(
            css_classes=["workspaces"],
            spacing=5,
            child=HYPRLAND.bind_many(
                ["workspaces", "active_workspace"],
                transform=lambda workspaces, active_workspace: [
                    WorkspaceButton(i) for i in workspaces
                ]
            )
        )


class WindowTitle(widgets.Label):
    def __init__(self):
        super().__init__(
            css_classes=["active-title"],
            ellipsize="end",
            max_width_chars=40,
            label=HYPRLAND.active_window.bind("title"),
        )
