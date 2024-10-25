{ lib, config, ... }:
let
    cfg = config.sys.terminal.tmux;
in {
    options = {
        sys.terminal.tmux.enable = lib.mkEnableOption "Enable tmux config";
    };

    config = lib.mkIf cfg.enable {
        home.file.".tmux.conf".source = ../../../tmux/tmux.conf;
    };
}
