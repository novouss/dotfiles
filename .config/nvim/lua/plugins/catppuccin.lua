return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    vim.cmd.colorscheme "catppuccin-frappe"

    require("catppuccin").setup {
      flavour = "frappe",
      transparent_background = true,
      auto_intergrations = true,
    }
  end
}
