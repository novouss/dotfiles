vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	-- Adds a limit that makes scrolloff go past EOF
	use 'Aasim-A/scrollEOF.nvim'

	-- Adds git symbols 
	use 'airblade/vim-gitgutter'

	-- Adds realtime color highlighting
	use 'brenoprata10/nvim-highlight-colors'

	-- Adds Language Server Protocol support (see lspconfig.nvim configuration)
	use 'neovim/nvim-lspconfig'

	-- Adds a fuzzy finder
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.8',
	  	requires = { {'nvim-lua/plenary.nvim'} }
	}

	-- Adds a file explorer
	use 'nvim-tree/nvim-tree.lua'


	-- Adds a code parser (see treesitter.nvim configuration)
	use {
		'nvim-treesitter/nvim-treesitter',
		{ run = ':TSUpdate' }
	}
end)

