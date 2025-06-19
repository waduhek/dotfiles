{ config, lib, pkgs, ... }:
let
    cfg = config.sys.iac.pulumi;
in {
    options = {
        sys.iac.pulumi.enable = lib.mkEnableOption "Enable Pulumi IaC";
    };

    config = lib.mkIf cfg.enable {
        home.packages = [
            pkgs.pulumi-bin
        ];
    };
}
