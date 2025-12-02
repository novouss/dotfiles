return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'williamboman/mason-lspconfig.nvim',
    'saghen/blink.cmp',
  },
  opts = {
    automatic_setup = true,
    servers = {
      biome = {},
      emmet_ls = {},
      eslint = {},
      eslint_lsp = {},
      lua_ls = {
        cmd = { 'lua-language-server' },
        filetypes = { 'lua' },
      },
      pyright = {},
      ts_ls = {},
      tailwindcss_language_server = {},
      typescript_language_server = {},
    }
  },
  config = function(_, opts)
    require('mason-lspconfig').setup {
      ensure_installed = {
        'lua_ls',
        'pyright',
        'ts_ls',
      }
    }

    for server, config in pairs(opts.servers) do
      vim.lsp.config(server, config)
      vim.lsp.enable(server)
    end
  end
}
