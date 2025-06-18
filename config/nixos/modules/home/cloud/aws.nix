{ config, lib, ... }:
let
    cfg = config.sys.cloud.awscli;
in {
    options = {
        sys.cloud.awscli.enable = lib.mkEnableOption "Enables AWS CLI";
    };

    config = lib.mkIf cfg.enable {
        programs.awscli.enable = true;
    };
}
