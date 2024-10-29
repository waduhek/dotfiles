{ lib, config, ... }:
let
    cfg = config.sys.desktop.sway;
in {
    options = {
        sys.desktop.sway.enable = lib.mkEnableOption "Enable sway configuration";
        sys.desktop.sway.pcConfig = lib.mkOption {
            type = lib.types.str;
            description = "Custom config for individual hosts";
            default = "";
            example = "";
        };
    };

    config = lib.mkIf cfg.enable {
        xdg.configFile = {
            sway = {
                source = ../../../sway;
                recursive = true;
            };
            "sway/pc_config.conf".text = cfg.pcConfig;
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
