{ config, pkgs, ... }:

{
    imports = [
        ../../modules/home
    ];

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

    # Config options set by modules.
    sys = {
        terminal = {
            alacritty.enable = true;
            tmux.enable = true;
        };
        desktop.sway.enable = true;
        editor.neovim.enable = true;
    };
}
