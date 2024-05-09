local harpoon = require("harpoon")

-- Open harpoon quick menu
vim.keymap.set(
    "n",
    "<C-q>",
    function ()
        harpoon.ui:toggle_quick_menu(harpoon:list())
    end
)

-- Harpoon the current file
vim.keymap.set(
    "n",
    "<leader>a",
    function()
        harpoon:list():add()
    end
)

-- Go to next buffer in harpoon list
vim.keymap.set(
    "n",
    "<C-h>",
    function()
        harpoon:list():prev()
    end
)

-- Go the previous buffer in harpoon list
vim.keymap.set(
    "n",
    "<C-l>",
    function()
        harpoon:list():next()
    end
)
