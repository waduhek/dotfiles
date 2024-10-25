{ lib, pkgs, config, ... }:
let
    cfg = config.sys.shell.zsh;

    # Shell init script for starting Sway with Nvidia using Vulkan.
    startWithNvidia = ''
        if [ "$(tty)" = "/dev/tty1" ];
        then
            export QT_QPA_PLATFORM=wayland
            export MOZ_ENABLE_WAYLAND=1
            export MOZ_WEBRENDER=1
            export XDG_SESSION_TYPE=wayland
            export XDG_CURRENT_DESKTOP=sway

            # Variables to get Sway to use Vulkan and not cause any screen flickering
            # that happens with the OpenGL renderer.
            export WLR_RENDERER=vulkan
            export WLR_NO_HARDWARE_CURSORS=1
            export XWAYLAND_NO_GLAMOR=1

            # Start Sway with unsupported GPU option for it to work with Nvidia.
            exec sway --unsupported-gpu
        fi
    '';

    # Shell init script for starting sway without Nvidia.
    startWithoutNvidia = ''
        if [ "$(tty)" = "/dev/tty1" ];
        then
            export QT_QPA_PLATFORM=wayland
            export MOZ_ENABLE_WAYLAND=1
            export MOZ_WEBRENDER=1
            export XDG_SESSION_TYPE=wayland
            export XDG_CURRENT_DESKTOP=sway

            exec sway
        fi
    '';
in {
    options = {
        sys.shell.zsh = {
            enable = lib.mkEnableOption "Enable Zsh";
            defaultShell = lib.mkEnableOption "Make zsh the default shell";
            swayEnabled = lib.mkEnableOption "Indicates if Sway is enabled";
            usingNvidia = lib.mkEnableOption "Indicate if host is using Nvidia";
        };
    };

    config = lib.mkIf cfg.enable {
        programs.zsh = {
            enable = true;
            enableCompletion = true;
            autosuggestions.enable = true;
            syntaxHighlighting.enable = true;

            shellInit = if cfg.swayEnabled
            then
                if cfg.usingNvidia
                then startWithNvidia
                else startWithoutNvidia
            else "";

            ohMyZsh = {
                enable = true;
                plugins = [ "git" "gitfast" "vi-mode" ];
                theme = "robbyrussell";
            };
        };

        users.defaultShell = if cfg.defaultShell then pkgs.zsh else null;
    };
}
