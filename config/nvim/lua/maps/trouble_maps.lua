-- Trouble.nvim keymaps
vim.keymap.set(
    "n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>",
    { silent = true, noremap = true }
)
vim.keymap.set(
    "n", "<leader>xd", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
    { silent = true, noremap = true }
)
vim.keymap.set(
    "n", "<leader>xl", "<cmd>Trouble loclist toggle<cr>",
    { silent = true, noremap = true }
)
vim.keymap.set(
    "n", "<leader>xq", "<cmd>Trouble qflist toggle<cr>",
    { silent = true, noremap = true }
)
