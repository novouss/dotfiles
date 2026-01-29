# Novouss' arch dotfiles

Configuration files used for the various tools I use in my Arch Linux System. Packages can be installed via the `pacman` package manager, others may require `git`, `curl`, or `yay`. Read sources for further documentation.

## Getting Started

```bash
# Install the following if you haven't already
sudo pacman -S curl fastfetch fzf git python
```

## GNU-Stow

This repository utilizes the `stow` utility that simplifies dotfile configuration from a single directory tree.

```bash
# Clone this repository
git clone https://github.com/novouss/dotfiles

# Install stow
sudo pacman -S stow

# Move to the dotfile folder
cd $HOME/dotfile

# Run stow
stow .
```

## Terminal 

This section contains all the tools being used in the terminal and their installation instructions.

### Terminal emulator

```bash
# Install kitty
sudo pacman -S kitty
```

### Text Editor

```bash
# Install neovim
sudo pacman -S neovim

# Install lazy.nvim source:https://github.com/folke/lazy.nvim
# This part should run automatically on opening neovim
nvim .
```

### Shell

```bash
# Install `zsh` unix shell 
sudo pacman -S zsh

# Install oh-my-zsh source:https://ohmyz.sh/#install
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Installing plugins source:https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins
git clone https://github.com/zsh-users/zsh-autosuggestions.git $HOME/oh-my-zsh/custom/plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/oh-my-zsh/custom/plugins

# Installing zsh pure sourcehttps://github.com/sindresorhus/pure 
git clone https://github.com/sindresorhus/pure.git $HOME/.zsh/pure
```

## Graphical User Interface

This section consists of creating the ui/ux.

### Fonts

```bash
# Install Comic Neue
sudo yay -S ttf-comic-neue

# Install NerdFonts
sudo yay -S ttf-jetbrains-mono-nerd 
```

### Window Manager 

```bash
# Install hyprland
sudo pacman -S hyprland

# Install hyprpaper (wallpapers)
sudo pacman -S hyprpaper
```

### Application Launcher

```bash
# Install bemenu
sudo pacman -S bemenu
```

### Graphical Interface 

```bash
# Install ignis.sh https://ignis-sh.github.io/ignis/stable/index.html
yay -S python-ignis
```

### Notification Manager

```bash
# Install dunst
sudo pacman -S dunst
```

## Others

This section is dedicated to optional additions that's mostly for the author's sake.

### LADSPA and Voice Isolation

```bash
# Install pipewire
sudo pacman -S pipewire

# Install LADSPA and pipewire plugins source:https://wiki.archlinux.org/title/PipeWire#Noise_suppression_for_voice
sudo pacman -S ladspa noise-suppression-for-voice

# Create a config directory for pipewire
# source: https://github.com/werman/noise-suppression-for-voice#pipewire
mkdir $HOME/.config/pipewire
mkdir $HOME/.config/pipewire/pirepwire.conf.d

# Download the linux-rnnoise.zip 
# https://github.com/werman/noise-suppression-for-voice/releases

# Move the librnnoise_ladspa.so to the ladspa user library directory
sudo mv /path/to/downloaded/librnnoise_ladspa.so /usr/lib/ladspa/

# Create a configuration for the plugin
vi $HOME/.config/pipewire/pipewire.conf.d/99-input-denoising.conf

# Copy the configuration from the noise-suppression-for-voice repository

# Change the following to where we placed the librnnoise_ladspa
# plugin = /usr/lib/ladspa/librnnoise_ladspa.so 

# Make modifications to the config. Refer to the repository

# Restart PipeWire
systemctl restart --user pipewire.service

# You should now have 'Noise Canceling source` as input
```

