{ lib, config, ... }:
let
    cfg = config.sys.terminal.alacritty;
in {
    options = {
        sys.terminal.alacritty.enable = lib.mkEnableOption "Enable alacritty config";
    };

    config = lib.mkIf cfg.enable {
        xdg.configFile = {
            alacritty = {
                source = ../../../alacritty;
                recursive = true;
            };
        };
    };
}
