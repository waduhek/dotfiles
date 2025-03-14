{ lib, pkgs, config, ... }:
let
    cfg = config.sys.encryption.gpg;
in {
    options = {
        sys.encryption.gpg = {
            enable = lib.mkEnableOption "Enable GPG";
            enableSshSupport = lib.mkEnableOption "Enable GPG SSH support";
            sshKeys = lib.mkOption {
                type = lib.types.listOf lib.types.str;
                description = "List of SSH keys to add. Must be Keygrips of the keys to add";
                default = [];
                example = [];
            };
        };
    };

    config = lib.mkIf cfg.enable {
        programs.gpg.enable = true;

        services.gpg-agent = {
            enable = true;
            defaultCacheTtl = 3600;
            defaultCacheTtlSsh = 3600;
            enableSshSupport = cfg.enableSshSupport;
            pinentryPackage = pkgs.pinentry-tty;
            sshKeys = cfg.sshKeys;
        };
    };
}
