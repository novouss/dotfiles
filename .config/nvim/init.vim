call plug#begin()

Plug 'tpope/vim-sensible'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'vimwiki/vimwiki'
Plug 'dhruvasagar/vim-table-mode'

call plug#end()

set nocompatible
filetype plugin on
syntax on

let g:vimwiki_list = [{ 
	\ 'path': '~/Documents/Notes/', 
	\ 'syntax': 'markdown', 
	\ 'ext': 'md' }]

set spell
set relativenumber
colorscheme catppuccin-macchiato

set linebreak

let g:airline_theme = 'catppuccin'

nnoremap <j> gj
nnoremap <k> gk

