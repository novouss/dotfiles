return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"saghen/blink.cmp",
	},
	config = function()
		require("mason-lspconfig").setup({
			ensure_installed = {
				"lua_ls",
				"ruff",
				"ts_ls",
				"tailwindcss",
			},
			automatic_installation = true,
		})

		vim.lsp.config("lua_ls", {
			settings = {
				Lua = {
					runtime = { version = "LuaJIT" },
					diagnostics = { globals = { "vim" } },
					workspace = {
						checkThirdParty = false,
						library = vim.api.nvim_get_runtime_file("", true),
					},
					telemetry = { enable = false },
				},
			},
		})
		vim.lsp.enable("lua_ls")

		for _, server in ipairs({ "ruff", "ts_ls", "tailwindcss", "eslint", "emmet_ls" }) do
			vim.lsp.enable(server)
		end

		local signs = { Error = "󰅚", Warn = "󰀪", Hint = "󰌶", Info = "󰋼" }
		for severity, icon in pairs(signs) do
			local name = "DiagnosticSign" .. severity
			vim.fn.sign_define(name, { text = icon, texthl = name })
		end
	end,
}
