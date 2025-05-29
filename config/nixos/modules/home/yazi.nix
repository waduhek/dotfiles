{ config, lib, ... }:
let
    cfg = config.sys.fileManagers.yazi;
in {
    options = {
        sys.fileManagers.yazi = {
            enable = lib.mkEnableOption "Enable yazi file manager";
        };
    };

    config = lib.mkIf cfg.enable {
        programs.yazi.enable = true;
    };
}
