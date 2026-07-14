# Novouss' arch dotfiles

Configuration files used for the various tools I use in my Arch Linux System. Packages can be installed via the `pacman` package manager, others may require `git`, `curl`, or `yay`. Read sources for further documentation.

## Getting Started

```bash
# Install the following, if you haven't already
sudo pacman -S fastfetch git fzf python curl
```

## GNU-Stow

This repository utilizes the `stow` utility that simplifies dotfiles configuration from a single directory tree.

```bash
# Clone this repository
git clone https://github.com/novouss/dotfiles

# Install stow
sudo pacman -S stow

# Move to the dotfile folder
cd $HOME/dotfiles

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

### KDE Plasma

```bash
# Install KDE Plasma
sudo pacman -S plasma sddm
```

## Others

This section is dedicated to optional additions that's mostly for the author's sake.

### EasyEffects and DeepFilterNet Plugin

```bash
# source:https://adamgradzki.com/adding-deepfilternet-noise-reduction-to-easy-effects-on-arch-linux.html
# Install EasyEffects
sudo pacman -S easyeffects

# Download the latest release of DeepFilterNet https://github.com/Rikorose/DeepFilterNet/releases
# Ensure you download the latest release (0.5.6 last checked)
curl -LO https://github.com/Rikorose/DeepFilterNet/releases/download/vx.x.x/libdeep_filter_ladspa-0.5.6-x86_64-unknown-linux-gnu.so

# Move and rename the DeepFilterNet file to the ladspa directory
sudo mv -v libdeep_filter_ladspa-0.5.6-x86_64-unknown-linux-gnu.so /usr/lib64/ladspa/libdeep_filter_ladspa.so

# Relaunch EasyEffects and add the DeepFilterNet effect.
```
