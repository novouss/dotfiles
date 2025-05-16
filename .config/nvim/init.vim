call plug#begin()

Plug 'tpope/vim-sensible'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'vimwiki/vimwiki'

call plug#end()

set spell
set relativenumber
colorscheme catppuccin-macchiato

let g:airline_theme = 'catppuccin'

nnoremap <j> gj
nnoremap <k> gk
" nnoremap <C-b> i****<Esc>hi

