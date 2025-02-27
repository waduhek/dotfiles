{ lib, config, ... }:
let
    cfg = config.sys.services.ssh;
in {
    options = {
        sys.services.ssh.enable = lib.mkEnableOption "Enable SSH";
        sys.services.ssh.enableAgent = lib.mkEnableOption "Enable SSH agent";
    };

    config = lib.mkIf cfg.enable {
        programs.ssh.enable = true;
        services.ssh-agent.enable = cfg.enableAgent;
    };
}
