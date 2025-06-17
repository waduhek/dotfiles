{ config, lib, pkgs, ... }:
let
    cfg = config.sys.torrent.qbittorrent;
in {
    options = {
        sys.torrent.qbittorrent.enable = lib.mkEnableOption "Enables qBittorent";
    };

    config = lib.mkIf cfg.enable {
        home.packages = [
            pkgs.qbittorrent
        ];
    };
}
