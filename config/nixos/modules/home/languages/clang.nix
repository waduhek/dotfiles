{ lib, config, pkgs, ... }:
let
    cfg = config.sys.language.clang;
in {
    options = {
        sys.language.clang.enable = lib.mkEnableOption "Enables clang and it's tools";
    };

    config = lib.mkIf cfg.enable {
        home.packages = with pkgs; [
            clang-tools
        ];
    };
}
