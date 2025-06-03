call plug#begin()

Plug 'tpope/vim-sensible'
Plug 'vim-airline/vim-airline' "Adds a status bar below nvim
Plug 'vim-airline/vim-airline-themes' "Allows themes to be applied to vim-airline
Plug 'catppuccin/nvim', { 'as': 'catppuccin' } "catppuccin theme for nvim
Plug 'vimwiki/vimwiki' "Adds notetaking scripts to nvim
Plug 'dhruvasagar/vim-table-mode' "Simplifies creating tables in nvim
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' } "Adds fuzzy finder to nvim
Plug 'airblade/vim-gitgutter' "Adds git symbols to nvim

call plug#end()

"vimwiki preliminaries
set nocompatible
filetype plugin on
syntax on

let g:vimwiki_list = [{ 
	\ 'path': '~/Documents/Notes/', 
	\ 'syntax': 'markdown', 
	\ 'ext': 'md' }]

"Sets 'catppuccin' as theme for vim-airline
let g:airline_theme = 'catppuccin'

"nvim spell checker
set spell spelllang=en_us

"Adds dynamic line numbers to nvim
set number relativenumber

colorscheme catppuccin-macchiato
set linebreak

"Centers the cursor to the middle of the window when moving [d]own
nnoremap <C-d> <C-d>zz

"Centers the cursor to the middle of the window when moving [u]p
nnoremap <C-u> <C-u>zz

"Moves the cursor to the end of the line when indenting
nnoremap >> >>$

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

