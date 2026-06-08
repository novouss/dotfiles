return {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("nvim-tree").setup({
			filters = {
				custom = {
					"__pycache__",
					".git",
					"node_modules",
				},
			},
			sort = {
				sorter = "case_sensitive",
			},
			view = {
				width = 40,
			},
			update_focused_file = {
				enable = true,
				update_cwd = true,
			},
		})

		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		vim.opt.termguicolors = true

		vim.keymap.set("n", "<C-e>", ":NvimTreeToggle<CR>", { desc = "Toggle nvimTree" })
	end,
}
