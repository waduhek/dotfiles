{ lib, config, ... }:
let
    # Config declared in sway.nix module.
    cfg = config.sys.desktop.sway;
in {
    config = lib.mkIf cfg.enable {
        xdg.configFile = {
            sway = {
                source = ../../../nvim;
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
