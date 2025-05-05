-- =================== Remaps ===================
-- Remap the scroll half page bind
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Remap the next pattern bind
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")

vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- =================== Git mappings ===================
-- Open vim-fugitive
vim.keymap.set("n", "<leader>G", vim.cmd.Git)

-- Select the the left buffer in diff mode (only works for vim-fugitive diffs)
vim.keymap.set("n", "<leader>ga", "<Cmd>diffget //2<CR>")
-- Select the the right buffer in diff mode (only works for vim-fugitive diffs)
vim.keymap.set("n", "<leader>gd", "<Cmd>diffget //3<CR>")

-- =================== LSP maps ===================
-- Manually trigger LSP completion
vim.keymap.set("i", "<C-Space>", function ()
    vim.lsp.completion.get()
end)
