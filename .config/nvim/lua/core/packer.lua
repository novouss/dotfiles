vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	-- Adds git symbols to neovim
	use 'airblade/vim-gitgutter'

	-- Adds a fuzzy finder
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.8',
	  	requires = { {'nvim-lua/plenary.nvim'} }
	}

	-- Adds a code parser (see treesitter.nvim configuration)
	use {
		'nvim-treesitter/nvim-treesitter',
		{ run = ':TSUpdate' }
	}

	-- Adds Language Server Protocol support (see lspconfig.nvim configuration)
	use 'neovim/nvim-lspconfig'

	-- Adds realtime color highlighting
	use 'brenoprata10/nvim-highlight-colors'

	-- Adds a limit that makes scrolloff go past EOF
	use 'Aasim-A/scrollEOF.nvim'
end)
