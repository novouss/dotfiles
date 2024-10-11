Author: novouss

# Suckless Dynamic Window Manager (dwm)

This directory is where you'll be placing your dwm fodlers. There are three (3) required files you need from the https://suckless.org/ website.

- [dwm](https://dwm.suckless.org/)
- [st](https://st.suckless.org/)
- [dmenu](https://tools.suckless.org/dmenu/)

# Requirements

- (optional) `picom` for transparency, shadows, and animations .

## Installation

### dwm

Move to the .dwm folder in your `$HOME` directory and run the following command.

```
$ git clone https://git.suckless.org/dwm
$ cd dwm
$ sudo make install
```

### dmenu

Move to the .dwm folder in your `$HOME` directory and run the following command.

```
$ git clone https://git.suckless.org/dmenu
$ cd dmenu
$ sudo make clean install
```

### st

Move to the .dwm folder in your `$HOME` directory and run the following command.

```
$ git clone https://git.suckless.org/st
$ cd suckless
$ sudo make clean install
```

## Patches

This dotfile requires a fair amount of patches, however optional, these were used for the build. To make organizing better, create a `patches` folder to store all your patches. 

```
$ rm -rf config.h
$ patch < patches/<file>
$ sudo make clean install
```

If you ever run into a `FAILED HUNK` you will have to patch the changes manually. Simply read the `.rej` file then copy and paste the changes to their designated files.

### dwm

Highly recommend patching first:

- [preserveonrestart](https://dwm.suckless.org/patches/preserveonrestart/)
- [restartsig](https://dwm.suckless.org/patches/restartsig/)

- [alpha](https://dwm.suckless.org/patches/alpha/)
- [alwayscenter](https://dwm.suckless.org/patches/alwayscenter/)
- [attachabove](https://dwm.suckless.org/patches/attachabove/)
- [autostart](https://dwm.suckless.org/patches/autostart/)
- [focusonclick](https://dwm.suckless.org/patches/focusonclick/)
- [uselessgap](https://dwm.suckless.org/patches/uselessgap/)

- [polybar-dwm-module](https://github.com/mihirlad55/polybar-dwm-module)

### dmenu

- [center](https://tools.suckless.org/dmenu/patches/center/)

### st

- [alpha](https://st.suckless.org/patches/alpha/)
- [scrollback](https://st.suckless.org/patches/scrollback/)

## Other Resources

### Polybar

Integrating Polybar can be confusing, just follow the installation guides and install the necessary packages.

https://github.com/mihirlad55/polybar-dwm-module
https://github.com/polybar/polybar

### dwm.desktop

There is a possibility that dwm will not appear in your login manager, for this all that needs to be done is to create one.

1. Create a `dwm.desktop` file as root

```
cd /usr/share/xsessions/
touch dwm.desktop
```

2. Copy the following information

```
[Desktop Entry]
Encoding=UTF-8
Name=dwm
Comment=Dynamic Window Manager
Exec=dwm
Icon=dwm
Type=XSession
```

3. Ensure that it include these permissions

```
$ ls -l /usr/share/xsessions/dwm.desktop
-rw-r--r-- 1 root root 108 Oct 11 10:11 /usr/share/xsessions/dwm.desktop
```

Credits to [bakkeby](https://www.reddit.com/r/suckless/comments/jj61py/comment/gaanvez/)

### dwm full installation guide

The creator of this video mistook the `config.def.h` file as the template file and decided to not edit out this error. Thus made the video incredibly confusing to follow early on. He corrects this somewhere in the middle, but his explaination on the `config.def.h` and `config.h` files were very confusing.

https://www.youtube.com/watch?v=6MaTMuFVGck&t=2742s

