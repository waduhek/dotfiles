{ lib, config, ... }:
let
    # Declared in alacritty.nix module.
    cfg = config.sys.terminal.alacritty;
in {
    config = lib.mkIf cfg.enable {
        xdg.configFile = {
            alacritty = {
                source = ../../../alacritty;
                recursive = true;
            };
        };
    };
}
