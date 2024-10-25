{ lib, config, ... }:
let
    cfg = config.sys.terminal.tmux;
in {
    config = lib.mkIf cfg.enable {
        home.".tmux.conf".source = ../../../tmux/tmux.conf;
    };
}
