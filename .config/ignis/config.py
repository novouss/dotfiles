import os

from ignis.app import IgnisApp
from ignis import utils
from ignis.css_manager import CssManager, CssInfoPath

from modules import (
    Bar,
)

app = IgnisApp.get_initialized()
css_manager = CssManager.get_default()

css_manager.apply_css(
    CssInfoPath(
        name="main",
        path=os.path.join(utils.get_current_dir(), "style.scss"),
        compiler_function=lambda path: utils.sass_compile(path=path),
    )
)


for monitor in range(utils.get_n_monitors()):
    Bar(monitor)
