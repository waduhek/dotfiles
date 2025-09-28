{ lib, config, pkgs, ... }:
let
    cfg = config.sys.peripherals.piper;
in {
    options = {
        sys.peripherals.piper.enable = lib.mkEnableOption "Enables Piper";
    };

    config = lib.mkIf cfg.enable {
        home.packages = with pkgs; [ piper ];
    };
}
