{ lib, config, ... }:
let
    cfg = config.sys.desktop.sway;
in {
    options = {
        sys.desktop.sway.enable = lib.mkEnableOption "Enable sway configuration";
    };

    config = lib.mkIf cfg.enable {
        xdg.configFile = {
            sway = {
                source = ../../../sway;
                recursive = true;
            };
            swaylock = {
                source = ../../../swaylock;
                recursive = true;
            };
            waybar = {
                source = ../../../waybar;
                recursive = true;
            };
        };
    };
}
