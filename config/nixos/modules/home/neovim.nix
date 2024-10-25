{ lib, config, ... }:
let
    cfg = config.sys.editor.neovim;
in {
    options = {
        sys.editor.neovim.enable = lib.mkEnableOption "Enable NeoVim config";
    };

    config = {
        xdg.configFile = {
            nvim = {
                source = ../../../nvim;
                recursive = true;
            };
        };
    };
}
