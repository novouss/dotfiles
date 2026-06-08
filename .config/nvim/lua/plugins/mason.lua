return {
	"williamboman/mason.nvim",
	opts = {
		ensure_installed = {
			"stylua",
			"prettier",
		},
	},
	config = function(_, opts)
		require("mason").setup(opts)
	end,
}
