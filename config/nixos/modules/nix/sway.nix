{ lib, pkgs, config, ... }:
let
    cfg = config.sys.desktop.sway;
in {
    options = {
        sys.desktop.sway.enable = lib.mkEnableOption "Enable Sway and its config";
    };

    config = lib.mkIf cfg.enable {
        environment.etc.wallpapers.source = ../../../../wallpapers;

        programs.sway = {
            enable = true;
            wrapperFeatures.gtk = true;
            extraPackages = with pkgs; [
                mako # Notification daemon for Sway.
                grim # Screenshot utility.
                slurp # Allows selecting portions of the screen.
                wl-clipboard # Provide `wl-copy` and `wl-paste` commands for clipboard.
                vulkan-validation-layers # For Vulkan support.
                waybar # Replacement for swaybar.
                swaylock # Screen locker.
                swayidle # Idle manager.
                bemenu # Menu library.
                swaybg # Background manager.
            ];
        };
    };
}
