{ lib, pkgs, config, ... }:
let
    cfg = config.sys.terminal.alacritty;
in {
    options = {
        sys.terminal.alacritty.enable = lib.mkEnableOption "Enables Alacritty";
    };

    config = lib.mkIf cfg.enable {
        environment.systemPackages = with pkgs; [
            alacritty
        ];
    };
}
