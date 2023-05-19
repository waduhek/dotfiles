local telescope = require("telescope")
local telescope_builtin = require("telescope.builtin")

-- Open find file prompt. The finder will include hidden files and
-- files in `.gitignore`
vim.keymap.set("n", "<leader>ff", function ()
    telescope_builtin.find_files({ hidden = true })
end)
-- Open live grep prompt
vim.keymap.set(
    "n",
    "<leader>fg",
    telescope.extensions.live_grep_args.live_grep_args
)
-- Open current buffers
vim.keymap.set("n", "<leader>fb", telescope_builtin.buffers)
-- Open help tags
vim.keymap.set("n", "<leader>fh", telescope_builtin.help_tags)
-- Show references of the word under the cursor using LSP
vim.keymap.set("n", "<leader>gr", telescope_builtin.lsp_references)
