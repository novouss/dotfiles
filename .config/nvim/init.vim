call plug#begin()

Plug 'tpope/vim-sensible'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }

call plug#end()

set relativenumber
colorscheme catppuccin-macchiato

let g:airline_theme = 'catppuccin'

