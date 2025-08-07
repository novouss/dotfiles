
# Novous' hyprland config

# Dependencies

These are the following packages used in the dotfiles.

```bash
sudo pacman -S ly kitty hyprland hyprpaper waybar neovim git zsh python stow dunst grim slurp wl-clipboard pipewire ladspa noise-suppression-for-voice
```

Optionally, install the following fonts or choose your own fonts (changing text fonts in config required).

```bash
sudo pacman -S ttf-jetbrains-mono-nerd ttf-ibm-plex
yay -i ttf-material-symbols-variable-git
```

## Uses of dependencies in dotfile

If one of the packages doesn't fit your need, feel free to replace them with your alternative.

- `ly` - serves as our login manager
- `kitty` - a GPU-powered linux terminal
- `hyprland` - serves as the desktop environment
- `hyprpaper` - a `hyprland` wallpaper utility
- `waybar` - a customizable bar for wayland
- `neovim` - serves as the terminal text editor
- `git` - version control and repository management
- `dunst` - a notification manager
- `zsh` - serves as the unix shell with enhanced features

## Others

These packages are often used together for a specific purpose, feel free to replace them with your alternative.

- `stow` - makes configuring dotfiles easier.
- `grim slurp wl-clipboard` - `grim` allows for capturing in wayland, `slurp` allows for region selection. `wl-clipboard` can be used so that screen capturing saves into clipboard.

# Using the dotfiles

## oh-my-zsh

After installing the `zsh` package, you can additionally install `oh-my-zsh`.

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

`Pure` is a clear and minimal zsh prompt you can install.

```bash
mkdir -p "$HOME/.zsh"
git clone https://github.com/sindresorhus/pure.git "$HOME/.zsh/pure"
```

As for plugins, the dotfile utilizes the `zsh-autosuggestions` and `zsh-syntax-highlighting` you need to clone from Github into your `.oh-my-zsh/custom/plugins` folder.

```bash
cd $HOME/.oh-my-zsh/custom/plugins/
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
git clone https://github.com/zsh-users/zsh-autosuggestions.git
```

## ly

After installing `ly` ensure that you've enabled the `ly.service` and disabled your default login manager (if any).

```bash
systemctl enable ly.service
```

## stow

```bash
git clone https://github.com/novouss/dotfiles/main.git && cd dotfiles
# Use stow to create the symlinks
stow .
```

