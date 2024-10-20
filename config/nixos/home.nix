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
            source = config.lib.file.mkOutOfStoreSymlink ../tmux/tmux.conf;
        };
        ".config/alacritty" = {
            source = config.lib.file.mkOutOfStoreSymlink ../alacritty;
        };
        ".config/sway" = {
            source = config.lib.file.mkOutOfStoreSymlink ../sway;
        };
        ".config/swaylock" = {
            source = config.lib.file.mkOutOfStoreSymlink ../swaylock;
        };
        ".config/waybar" = {
            source = config.lib.file.mkOutOfStoreSymlink ../waybar;
        };
        ".config/nvim" = {
            source = config.lib.file.mkOutOfStoreSymlink ../nvim;
        };
    };
}
