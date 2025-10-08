import datetime

from ignis import widgets
from ignis import utils


def datetime_format(frmt: str) -> str:
    return datetime.datetime.now().strftime(frmt)


class Clock(widgets.Label):
    def __init__(self):
        super().__init__(
            label=utils.Poll(
                1000,
                lambda _: datetime_format("  %I:%M %p")
            ).bind("output")
        )


class Date(widgets.Label):
    def __init__(self):
        super().__init__(
            label=utils.Poll(
                3_600_000,
                lambda _: datetime_format("  %a %e")
            ).bind("output")
        )
