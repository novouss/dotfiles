
# Novouss' arch dotfiles

These are configuration files to setup tools, workspaces, and other settings and preferences.

# Preliminaries

This section summarizes most of dependencies the dotfiles use.

## Pacman Installations

Using the `pacman` package manager, install the following programs.

```bash
sudo pacman -S kitty stow zsh steam discord nvim fastfetch ranger mangohud git
```

*Installing `firefox` is optional, try `zen`*

## zsh and oh-my-zsh

You must have zsh installed before installing oh-my-zsh, simply install the zsh package from [pacman](#pacman-installations).

```bash
# Install via curl
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

[Source](https://ohmyz.sh/)

## Neovim and vim-plug

```bash
# Install via curl
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

After installing vim-plug, open neovim and run the `:PlugInstall` command.

[Source](https://github.com/junegunn/vim-plug?tab=readme-ov-file#neovim)

## Git Repositories

The following packages were (from experience) better off complied from source.

### oh-my-zsh pure

```bash
# Cloning the repository
mkdir -p "$HOME/.zsh"
git clone https://github.com/sindresorhus/pure.git "$HOME/.zsh/pure"
```

[Source](https://github.com/sindresorhus/pure)

### oh-my-zsh plugins

Various plugins were used for oh-my-zsh, these plugins are installed inside the `.oh-my-zsh/custom/plugins` folder.

```bash
# Enables syntax highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
```

```bash
# Enables autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions.git
```

### KDE Plasma catppuccin

```bash
# Cloning the repository
git clone --depth=1 http://github.com/catppuccin/kde catppuccin-kde && cd catppuccin-kde
./install.sh
# You should be given different catppuccin flavours, for the dotfiles, catppuccin-frappe red was used
```

[Source](https://github.com/catppuccin/kde)

## Installation and GNU-Stow

Stow simplifies dotfile configurations by creating symlinks from a single directory tree. Ensure that you clone the repository inside your `$HOME` directory.

```bash
# Cloning the repository
git clone https://github.com/novouss/dotfiles.git
# Running stow
cd dotfiles
stow .
```

## Screenshots

![fastfetch-terminal](./assets/fastfetch-terminal.png)
<p style="text-align:center;">Terminal with fastfetch</p>

![nvim-terminal](./assets/nvim-terminal.png)
<p style="text-align:center;">Terminal with nvim</p>

![plasma-themed](./assets/plasma-themed.png)
<p style="text-align:center;">Plasma theme with catppuccin</p>

## Optionals

This section is dedicated to optional configurations that weren't necessarily used in configuration, but good to know if the user wishes to utilize it.

### Vesktop/Vencord Theme

Using the AUR or `yay` package manager to install 'vesktop'.

```bash
# Installing vesktop
yay -i vesktop
```

To install a catppuccin theme, login to discord, head to user settings, and under Themes open Online Themes.

Visit the [catppuccin Discord fork repository](https://github.com/catppuccin/discord) or copy and paste the following links inside the Online Themes Textbox.

```
# You can grab these links from the repository, and be sure to grab the direct links to the file
https://raw.githubusercontent.com/catppuccin/discord/refs/heads/main/themes/macchiato.theme.css
https://raw.githubusercontent.com/catppuccin/discord/refs/heads/main/themes/frappe.theme.css
```

