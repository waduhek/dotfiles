local nvim_tree = require("nvim-tree.api")

vim.keymap.set(
    "n",
    "<C-t>",
    function()
        nvim_tree.tree.toggle({
            find_file = true,
            focus = false,
        })
    end
)
vim.keymap.set(
    "n",
    ",t",
    function() 
        nvim_tree.tree.find_file({
            open = true,
            focus = true,
        })
    end
)
