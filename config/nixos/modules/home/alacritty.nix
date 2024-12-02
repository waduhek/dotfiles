{ lib, config, ... }:
let
    cfg = config.sys.terminal.alacritty;
in {
    options = {
        sys.terminal.alacritty.enable = lib.mkEnableOption "Enables Alacritty";
    };

    config = lib.mkIf cfg.enable {
        programs.alacritty.enable = true;

        xdg.configFile = {
            alacritty = {
                source = ../../../alacritty;
                recursive = true;
            };
        };
    };
}
