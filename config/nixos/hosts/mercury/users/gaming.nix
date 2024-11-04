{ pkgs, ... }:
{
    imports = [
        ../../../modules/home
    ];

    home.stateVersion = "24.05";

    home.username = "gaming";
    home.homeDirectory = "/home/gaming";

    home.packages = with pkgs; [ steam discord ];

    sys = {
        terminal = {
            alacritty.enable = true;
            tmux.enable = true;
        };
    };
}
