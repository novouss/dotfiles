#!/bin/sh
scrot --select --freeze $HOME/Pictures/Screenshots/%F-%T.png -e 'xclip -selection clipboard -t image/png -i $f'
