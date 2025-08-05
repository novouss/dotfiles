
# Novous' hyprland config

# Dependencies

These are the following packages used in the dotfiles.

```bash
sudo pacman -S ly kitty hyprland hyprpaper waybar neovim git python stow dunst grim slurp wl-clipboard
```

Optionally, install the following fonts or choose your own fonts (changing text fonts in config required).

```bash
sudo pacman -S ttf-jetbrains-mono-nerd ttf-ibm-plex
yay -i ttf-material-symbols-variable-git
```

## Uses of dependencies in dotfile

If one of the packages doesn't fit your need, feel free to replace them with your alternative.

`ly` - serves as our login manager
`kitty` - a GPU-powered linux terminal
`hyprland` - serves as the desktop environment
`hyprpaper` - a `hyprland` wallpaper utility
`waybar` - a customizable bar for wayland
`neovim` - serves as the terminal text editor
`git` - version control and repository management
`dunst` - a notification manager

## Others

These packages are often used together for a specific purpose, feel free to replace them with your alternative.

`stow` - makes configuring dotfiles easier.
`grim slurp wl-clipboard` - `grim` allows for capturing in wayland, `slurp` allows for region selection. `wl-clipboard` can be used so that screen capturing saves into clipboard.

# Using the dotfiles

## stow

```bash
git clone https://github.com/novouss/dotfiles/main.git && cd dotfiles
# Use stow to create the symlinks
stow .
```

## ly

After installing `ly` ensure that you've enabled the `ly.service` and disabled your default login manager (if any).

```bash
systemctl enable ly.service
```
