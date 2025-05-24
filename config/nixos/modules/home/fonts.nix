{ lib, pkgs, config, ...}:
let
    cfg = config.sys.fonts.nerdfonts;
in {
    options = {
        sys.fonts.nerdfonts = {
            enable = lib.mkEnableOption "Enable Nerdfonts";
        };
    };

    config = lib.mkIf cfg.enable {
        fonts.fontconfig.enable = true;
        home.packages = with pkgs; [
            nerd-fonts.fira-mono
        ];
    };
}
