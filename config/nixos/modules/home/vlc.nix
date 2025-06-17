{ config, lib, pkgs, ... }:
let
    cfg = config.sys.media.vlc;
in {
    options = {
        sys.media.vlc.enable = lib.mkEnableOption "Enable VLC media player";
    };

    config = lib.mkIf cfg.enable {
        home.packages = [
            pkgs.vlc
        ];
    };
}
