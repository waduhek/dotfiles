{ lib, config, pkgs, ... }:
let
    cfg = config.sys.language.go;
in {
    options = {
        sys.language.go.enable = lib.mkEnableOption "Enable Go programming language";
    };

    config = lib.mkIf cfg.enable {
        environment.systemPackages = with pkgs; [ go ];
    };
}
