-- 'n' - refers to normal mode
-- 'i' - refers to insert mode
-- 'v' - refers to visual mode

-- Centers the cursor to the middle of the window when moving [d]own
vim.keymap.set("n", "<C-d>", "<C-d>zz", { noremap = true, silent = true })

-- Centers the cursor to the middle of the window when moving [u]p
vim.keymap.set("n", "<C-u>", "<C-u>zz", { noremap = true, silent = true })

-- Moves the cursor to the end of the line when indenting
vim.keymap.set("n", ">>", ">>$", { noremap = true, silent = true })

