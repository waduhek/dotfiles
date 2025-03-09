{ config, lib, pkgs, ... }:
let
    cfg = config.sys.language.protobuf;
in {
    options = {
        sys.language.protobuf.enable = lib.mkEnableOption "Enable Protobuf";
    };

    config = lib.mkIf cfg.enable {
        home.packages = with pkgs; [ protobuf ];
    };
}
