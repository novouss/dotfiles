call plug#begin()

Plug 'tpope/vim-sensible'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'vimwiki/vimwiki'
Plug 'dhruvasagar/vim-table-mode'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' }

call plug#end()

set nocompatible
filetype plugin on
syntax on

let g:vimwiki_list = [{ 
	\ 'path': '~/Documents/Notes/', 
	\ 'syntax': 'markdown', 
	\ 'ext': 'md' }]

let g:airline_theme = 'catppuccin'

set spell
set relativenumber
colorscheme catppuccin-macchiato

set linebreak

nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
nnoremap >> >>$

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

