-- Completion config.
vim.opt.completeopt = { "menuone", "noinsert", "noselect", "popup", "fuzzy" }

-- Use spaces for indentation
vim.opt.expandtab = true

-- Enable ftplugin
vim.api.nvim_command("filetype plugin indent on")

-- Use Carbonfox theme
vim.cmd("colorscheme catppuccin")

-- Show a vertical line after 80 characters
vim.opt.colorcolumn = "80"

-- Enable line numbers
vim.opt.number = true
-- Enable relative line numbers
vim.opt.relativenumber = true

-- Show gutter
vim.opt.signcolumn = "yes"

-- Highlight current line
vim.opt.cursorline = true

-- Enable 24-bit colours
vim.opt.termguicolors = true

-- Disable line wrapping.
vim.opt.wrap = false

-- Never show the tabline
vim.opt.showtabline = 0

-- Show the current branch using Fugitive plugin.
vim.opt.statusline = "%<%f %h%m%r%{FugitiveStatusline()}%=%-14.(%l,%c%V%) %P"
