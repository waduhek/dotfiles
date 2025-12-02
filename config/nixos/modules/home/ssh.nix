{ lib, config, ... }:
let
    cfg = config.sys.services.ssh;
in {
    options = {
        sys.services.ssh.enable = lib.mkEnableOption "Enable SSH";
        sys.services.ssh.enableAgent = lib.mkEnableOption "Enable SSH agent";
    };

    config = lib.mkIf cfg.enable {
        programs.ssh = {
            enable = true;
            enableDefaultConfig = false;
            matchBlocks."*" = {
                forwardAgent = false;
                addKeysToAgent = "no";
                compression = false;
                serverAliveInterval = 0;
                serverAliveCountMax = 3;
                hashKnownHosts = false;
                userKnownHostsFile = "~/.ssh/known_hosts";
                controlMaster = "no";
                controlPath = "~/.ssh/master-%r@%n:%p";
                controlPersist = "no";
            };
        };
        services.ssh-agent.enable = cfg.enableAgent;
    };
}
