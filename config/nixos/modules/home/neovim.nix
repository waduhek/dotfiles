{ lib, config, ... }:
let
    cfg = config.sys.editor.neovim;
in {
    options = {
        sys.editor.neovim.enable = lib.mkEnableOption "Enable NeoVim config";
        sys.editor.neovim.lspConfig = lib.mkOption {
            type = lib.types.str;
            description = "LSP servers to register";
            default = "";
            example = "";
        };
    };

    config = {
        xdg.configFile = {
            "nvim/lua/constants/lsp_servers.lua".text = cfg.lspConfig;
            nvim = {
                source = ../../../nvim;
                recursive = true;
            };
        };
    };
}
