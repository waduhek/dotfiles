# NeoVim config

## Adding LSP servers

* Ensure that the server you wish to use is listed in 
[nvim-lspconfig](https://github.com/neovim/nvim-lspconfig).

* Open `constants/lsp_servers.lua` file and add the server name as shown in
[nvim-lspconfig](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md)

## Dependencies

* [Optional] Install [ripgrep](https://github.com/BurntSushi/ripgrep) for live
grep support with `telescope.nvim`.

* [Optional] Install [fd](https://github.com/sharkdp/fd) for better finder
support with `telescope.nvim`.
