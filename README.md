
# Novous' arch-quickshell config

**Login Screen**: Ly (fairyglade/ly)
**Desktop Environment**: Hyprland
**Graphical Interface**: Quickshell (soramine template)
**Terminal**: kitty
**Text Editior**: neovim
 
## Neovim configuration

This configuration made use of the `packer` package manager. Run the following command.

```bash
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

As for the language server protocol the `nvim-lspconfig` was used.

```bash
git clone https://github.com/neovim/nvim-lspconfig\
~/.config/nvim/pack/nvim/start/nvim-lspconfig
```

