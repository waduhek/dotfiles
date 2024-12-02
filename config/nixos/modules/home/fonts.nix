{ lib, pkgs, config, ...}:
let
    cfg = config.sys.fonts.nerdfonts;
in {
    options = {
        sys.fonts.nerdfonts = {
            enable = lib.mkEnableOption "Enable Nerdfonts";
            installFonts = lib.mkOption {
                type = lib.types.listOf lib.types.str;
                description = "List of nerdfonts to install";
                default = [];
                example = [ "Hack" ];
            };
        };
    };

    config = lib.mkIf cfg.enable {
        fonts.fontconfig.enable = true;
        home.packages = [
            (pkgs.nerdfonts.override { fonts = cfg.installFonts; })
        ];
    };
}
