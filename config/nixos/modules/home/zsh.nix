{ lib, config, ... }:
let
    cfg = config.sys.shell.zsh;
in {
    options = {
        sys.shell.zsh = {
            enable = lib.mkEnableOption "Enable Zsh";
            omzPlugins = lib.mkOption {
                type = lib.types.listOf lib.types.str;
                description = "List of OMZ plugins to use";
                default = [ ];
                example = [ "git" "gitfast" ];
            };
        };
    };

    config = lib.mkIf cfg.enable {
        programs.zsh = {
            enable = true;
            enableCompletion = true;
            defaultKeymap = "viins";
            autosuggestion.enable = true;
            syntaxHighlighting.enable = true;

            oh-my-zsh = {
                enable = true;
                plugins = cfg.omzPlugins;
                theme = "robbyrussell";
            };
        };
    };
}
