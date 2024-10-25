{ lib, pkgs, config, ... }:
let
    cfg = config.sys.terminal.tmux;
in {
    options = {
        sys.terminal.tmux.enable = lib.mkEnableOption "Enable tmux";
    };

    config = {
        environment.systemPackages = with pkgs; [
            tmux
        ];
    };
}
