{ lib, config, pkgs, ... }:
let
    cfg = config.sys.language.python;
in {
    options = {
        sys.language.python.enable = lib.mkEnableOption "Enable Python";
    };

    config = lib.mkIf cfg.enable {
        environment.systemPackages = with pkgs; [ python3 ];
    };
}
