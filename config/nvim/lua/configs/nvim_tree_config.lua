local nvim_tree = require("nvim-tree")

-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

nvim_tree.setup({
    git = {
        ignore = false,
    },
    view = {
        mappings = {
            list = {
                { key = "<C-e>", action = "" },
            },
        },
    },
})

---Opens `NvimTree` if the `nvim` is opened from a directory.
---Refer: https://github.com/nvim-tree/nvim-tree.lua/wiki/Open-At-Startup
---@param data any
local function open_nvim_tree(data)

    -- buffer is a directory
    local directory = vim.fn.isdirectory(data.file) == 1

    if not directory then
        return
    end

    -- create a new, empty buffer
    vim.cmd.enew()

    -- wipe the directory buffer
    vim.cmd.bw(data.buf)

    -- change to the directory
    vim.cmd.cd(data.file)

    -- open the tree
    require("nvim-tree.api").tree.open()
end

-- Open NvimTree after all plugins have started
vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
