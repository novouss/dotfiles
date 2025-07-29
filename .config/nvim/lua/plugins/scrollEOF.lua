return {
  "Aasim-A/scrollEOF.nvim",
  config = function()
    require("scrollEOF").setup {}
    vim.opt.scrolloff = 9
  end
}
