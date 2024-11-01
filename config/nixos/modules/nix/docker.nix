{ lib, config, pkgs, ... }:
let
    cfg = config.sys.virtualisation.docker;
in {
    options = {
        sys.virtualisation.docker.enable = lib.mkEnableOption "Enable Docker";
    };

    config = lib.mkIf cfg.enable {
        virtualisation.docker = {
            enable = true;
            extraPackages = with pkgs; [ docker-compose ];
        };

        users.extraGroups.docker.members = [ "ryan" ];
    };
}
