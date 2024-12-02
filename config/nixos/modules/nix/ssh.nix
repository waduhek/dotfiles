{ lib, pkgs, config, ... }:
let
    cfg = config.sys.services.ssh;
in {
    options = {
        sys.services.ssh.enable = lib.mkEnableOption "Enable SSH";
        sys.services.ssh.enableAgent = lib.mkEnableOption "Enable SSH agent";
    };

    config = lib.mkIf cfg.enable {
        services.openssh.enable = true;
        programs.ssh.startAgent = true;
    };
}
