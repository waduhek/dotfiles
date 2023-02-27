-- This file will not be rewritten by the installation step after the first
-- installation.
local P = {}

function P.get_lsp_servers()
    return {
        -- Add LSP servers here. Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
        -- for the list of available language servers and the steps required for
        -- installation. Example:
        -- "rust_analyzer",
    }
end

return P
