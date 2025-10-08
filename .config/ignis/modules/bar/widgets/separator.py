from ignis import widgets


class Separator(widgets.Separator):
    def __init__(self):
        super().__init__(
            vertical=True,
            css_classes=["middle-separator"]
        )
