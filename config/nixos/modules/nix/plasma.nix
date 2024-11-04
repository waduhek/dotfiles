{ lib, config, pkgs, ... }:
let
    cfg = config.sys.desktop.plasma;
in {
    options = {
        sys.desktop.plasma.enable = lib.mkEnableOption "Enable KDE Plasma";
    };

    config = lib.mkIf cfg.enable {
        services.xserver.enable = true;
        services.desktopManager.plasma6.enable = true;

        environment.plasma6.excludePackages = with pkgs.kdePackages; [
            plasma-browser-integration
            konsole
        ];
    };
}
