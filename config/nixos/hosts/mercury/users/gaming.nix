{ pkgs, ... }:
{
    imports = [
        ../../../modules/home
    ];

    home.stateVersion = "24.05";

    home.username = "gaming";
    home.homeDirectory = "/home/gaming";

    home.packages = with pkgs; [ steam webcord ];

    sys = {
        fonts.nerdfonts = {
            enable = true;
            installFonts = [ "Hack" ];
        };
        terminal = {
            alacritty.enable = true;
            tmux.enable = true;
        };
    };
}
