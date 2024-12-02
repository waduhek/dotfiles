{ lib, config, pkgs, ... }:
let
    cfg = config.sys.language.rust;
in {
    options = {
        sys.language.rust.enable = lib.mkEnableOption "Enable Rust, installs rustup package";
    };

    config = lib.mkIf cfg.enable {
        home.packages = with pkgs; [ rustup ];
    };
}
