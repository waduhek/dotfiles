local nvim_tree = require("nvim-tree.api")

vim.keymap.set("n", "<C-t>", nvim_tree.tree.toggle)
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
