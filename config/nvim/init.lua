-- Load plugins
require("plugins")
-- Load configs
require("configs.configs")
-- Completion config.
vim.o.completeopt = "menu,menuone,noselect"

-- Indentation setting
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = -1
vim.opt.shiftwidth = 0
vim.api.nvim_command("filetype plugin on")

vim.opt.colorcolumn = "80"

-- =================== Keymaps ===================
require("maps.maps")

-- =================== Customisation ===================
-- Use Carbonfox theme
vim.cmd("colorscheme carbonfox")

-- Enable line numbers
vim.opt.number = true

-- Show gutter
vim.opt.signcolumn = "yes"

-- Highlight current line
vim.opt.cursorline = true

-- Enable 24-bit colours
vim.opt.termguicolors = true

-- Disable line wrapping.
vim.opt.wrap = false

-- Always show the tabline
vim.opt.showtabline = 2
