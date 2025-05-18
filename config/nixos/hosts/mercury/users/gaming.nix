{ pkgs, ... }:
{
    imports = [
        ../../../modules/home
    ];

    home.stateVersion = "24.05";

    home.username = "gaming";
    home.homeDirectory = "/home/gaming";

    home.packages = with pkgs; [ steam ];

    sys = {
        shell.zsh.enable = true;
        fonts.nerdfonts = {
            enable = true;
            installFonts = [ "FiraMono" ];
        };
        terminal = {
            alacritty.enable = true;
            tmux.enable = true;
        };
        messengers.signal.enable = true;
        encryption.gpg.enable = true;
    };
}
