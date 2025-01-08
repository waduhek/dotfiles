{ lib, pkgs, config, ... }:
let
    cfg = config.sys.messengers.signal;
in {
    options = {
        sys.messengers.signal.enable = lib.mkEnableOption "Enables Signal messenger";
    };

    config = lib.mkIf cfg.enable {
        home.packages = [ pkgs.signal-desktop ];
    };
}
