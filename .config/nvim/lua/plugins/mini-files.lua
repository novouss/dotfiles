return {
  "echasnovski/mini.files", 
  version = false,
  config = function()
    require("mini.files").setup {
      mappings = {
        close = "q",
        show_help = "g?",
      },
      options = {
        use_as_default_explorer = true,
      },
    }

    vim.keymap.set("n", "<C-e>", function() 
      require("mini.files").open()
    end, { desc = "Open MiniFiles" })
  end
}
