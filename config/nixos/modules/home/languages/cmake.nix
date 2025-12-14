{ config, lib, pkgs, ... }:
let
    cfg = config.sys.language.cmake;
in {
    options = {
        sys.language.cmake.enable = lib.mkEnableOption "Enables CMake";
    };

    config = lib.mkIf cfg.enable {
        home.packages = with pkgs; [ cmake ];
    };
}
