vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	-- Adds git symbols to neovim
	use 'airblade/vim-gitgutter'

	-- Fuzzy finder
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.8',
	  	requires = { {'nvim-lua/plenary.nvim'} }
	}

	-- Code parser
	use {
		'nvim-treesitter/nvim-treesitter',
		{ run = ':TSUpdate' }
	}

	-- Language Server Protocols
	use 'neovim/nvim-lspconfig'

	-- Realtime color highlighting
	use 'brenoprata10/nvim-highlight-colors'
end)
