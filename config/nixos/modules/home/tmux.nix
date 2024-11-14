{ lib, config, ... }:
let
    cfg = config.sys.terminal.tmux;
in {
    options = {
        sys.terminal.tmux.enable = lib.mkEnableOption "Enable tmux";
    };

    config = lib.mkIf cfg.enable {
        programs.tmux.enable = true;

        xdg.configFile.tmux = {
            source = ../../../tmux;
            recursive = true;
        };
    };
}
