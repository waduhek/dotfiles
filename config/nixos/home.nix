{ config, pkgs, ... }:

{
    home.stateVersion = "24.05";

    home.username = "ryan";
    home.homeDirectory = "/home/ryan";

    programs.home-manager.enable = true;

    programs.git = {
        enable = true;
        userName = "Ryan Noronha";
        userEmail = "ryannor56a@proton.me";
    };

    services.gpg-agent = {
        enable = true;
        defaultCacheTtl = 1800;
        enableSshSupport = true;
    };

    home.file = {
        ".tmux.conf" = {
            source = ../tmux/tmux.conf;
        };
        ".config/alacritty" = {
            source = ../alacritty;
        };
        ".config/sway" = {
            source = ../sway;
        };
        ".config/swaylock" = {
            source = ../swaylock;
        };
        ".config/waybar" = {
            source = ../waybar;
        };
        ".config/nvim" = {
            source = ../nvim;
        };
    };
}
