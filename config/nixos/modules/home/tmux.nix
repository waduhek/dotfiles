{ lib, config, ... }:
let
    cfg = config.sys.terminal.tmux;
in {
    options = {
        sys.terminal.tmux.enable = lib.mkEnableOption "Enable tmux";
    };

    config = lib.mkIf cfg.enable {
        programs.tmux.enable = true;

        home.file.".tmux.conf".source = ../../../tmux/tmux.conf;
    };
}
