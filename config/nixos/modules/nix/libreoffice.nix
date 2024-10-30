{ lib, pkgs, config, ... }:
let
    cfg = config.sys.productivity.libreoffice;
in {
    options = {
        sys.productivity.libreoffice.enable = lib.mkEnableOption "Enable Libreoffice";
    };

    config = lib.mkIf cfg.enable {
        environment.systemPackages = with pkgs; [
            libreoffice-fresh
        ];
    };
}
