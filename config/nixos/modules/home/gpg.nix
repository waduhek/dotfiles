{ lib, pkgs, config, ... }:
let
    cfg = config.sys.encryption.gpg;
in {
    options = {
        sys.encryption.gpg.enable = lib.mkEnableOption "Enable GPG";
    };

    config = lib.mkIf cfg.enable {
        programs.gpg.enable = true;

        services.gpg-agent = {
            enable = true;
            defaultCacheTtl = 1800;
            enableSshSupport = true;
            pinentryPackage = pkgs.pinentry-tty;
        };
    };
}
