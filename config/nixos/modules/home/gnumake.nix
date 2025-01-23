{ config, lib, pkgs, ... }:
let
    cfg = config.sys.buildTools.gnumake;
in {
    options = {
        sys.buildTools.gnumake.enable = lib.mkEnableOption "Enable GNU Make";
    };

    config = lib.mkIf cfg.enable {
        home.packages = with pkgs; [ gnumake ];
    };
}
