{ lib, config, ... }:
let
    # Declared in neovim.nix module.
    cfg = config.sys.editor.neovim;
in {
    config = {
        xdg.configFile = {
            nvim = {
                source = ../../../nvim;
                recursive = true;
            };
        };
    };
}
