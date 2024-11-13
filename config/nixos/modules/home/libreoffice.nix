{ lib, pkgs, config, ... }:
let
    cfg = config.sys.productivity.libreoffice;
in {
    options = {
        sys.productivity.libreoffice.enable = lib.mkEnableOption "Enable Libreoffice";
    };

    config = lib.mkIf cfg.enable {
        home.packages = with pkgs; [ libreoffice-fresh ];
    };
}
