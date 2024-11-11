{ lib, pkgs, config, ... }:
let
    cfg = config.sys.desktop.sway;

    # Use unstable nixpkgs till sway 1.10 lands in 24.11.
    # TODO: Switch back to stable nixpkgs after 24.11.
    unstablePkgs = import (fetchGit {
        url = "https://github.com/nixos/nixpkgs";
        ref = "nixos-unstable";
        rev = "76612b17c0ce71689921ca12d9ffdc9c23ce40b2";
    }) { inherit (pkgs) system; };
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
            package = unstablePkgs.sway;
        };
    };
}
