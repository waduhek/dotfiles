-- Go to the next tab.
vim.keymap.set("n", "<C-l>", "<Cmd>tabn<CR>")
-- Go to the previous tab.
vim.keymap.set("n", "<C-h>", "<Cmd>tabp<CR>")

-- =================== Remaps ===================
-- Remap the scroll half page bind
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Remap the next pattern bind
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")
