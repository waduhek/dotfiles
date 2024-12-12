{ pkgs, ... }:
{
    imports = [
        ../../../modules/home
    ];

    home.stateVersion = "24.11";

    home.username = "ryan";
    home.homeDirectory = "/home/ryan";

    programs.home-manager.enable = true;

    home.packages = with pkgs; [ steam webcord ];

    programs.git = {
        enable = true;
        userName = "Ryan Noronha";
        userEmail = "ryannor56a@proton.me";
        signing = {
            signByDefault = true;
            key = "1CEABC4E67177BB7!";
        };
        extraConfig = {
            core.editor = "nvim";

            init.defaultBranch = "main";

            diff.tool = "nvimdiff";
            "difftool \"nvimdiff\"".cmd = "nvim -d $LOCAL $REMOTE";

            merge.tool = "nvim";
            "mergetool \"nvim\"".cmd = "nvim $MERGED";

            pager = {
                branch = false;
                stash = false;
            };
        };
    };

    sys = {
        fonts.nerdfonts = {
            enable = true;
            installFonts = [ "Hack" ];
        };
        terminal = {
            alacritty.enable = true;
            tmux.enable = true;
        };
        encryption.gpg.enable = true;
    };
}