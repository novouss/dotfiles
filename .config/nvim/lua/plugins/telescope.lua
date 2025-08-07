return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local ignore_files = {
      ".git/",
      ".cache",
      "%.o",
      "%.a",
      "%.out",
      "%.class",
    }
    require("telescope").setup {
      pickers = {
        find_files = {
          file_ignore_patterns = ignore_files,
          hidden = true,
        },
        live_grep = {
          file_ignore_patterns = ignore_files,
          additional_args = function (_)
            return { "--hidden" }
          end
        },
      }
    }

    local builtin = require("telescope.builtin")

    vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
    vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
  end
}
