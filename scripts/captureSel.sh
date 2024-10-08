#!/bin/sh
scrot --select --freeze /home/novouss/Pictures/Screenshots/%F-%T.png -e 'xclip -selection clipboard -t image/png -i $f'
