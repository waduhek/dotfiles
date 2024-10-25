{ lib, pkgs, config, ... }:
let
    cfg = config.sys.fonts.nerdfonts;
in {
    options = {
        sys.fonts.nerdfonts.enable = lib.mkEnableOption "Enable Nerd fonts";
    };

    config = lib.mkIf cfg.enable {
        environments.systemPackages = with pkgs; [
            nerdfonts
        ];

        fonts.packages = with pkgs; [
            (nerdfonts.override { fonts = [ "Hack" ]; })
        ];
    };
}
