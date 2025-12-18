{ lib, config, pkgs, ... }:
let
    cfg = config.sys.language.nodejs;
in {
    options = {
        sys.language.nodejs.enable = lib.mkEnableOption "Enable NodeJS runtime";
    };

    config = lib.mkIf cfg.enable {
        home.packages = with pkgs; [
            nodejs_24
            typescript-language-server
        ];
    };
}
