{ config, lib, ... }:
let
    cfg = config.sys.wireless.bluetooth;
in {
    options = {
        sys.wireless.bluetooth = {
            enable = lib.mkEnableOption "Enables bluetooth module";
            powerOnBoot = lib.mkEnableOption "Enable bluetooth on boot";
        };
    };

    config = lib.mkIf cfg.enable {
        hardware.bluetooth = {
            enable = true;
            powerOnBoot = cfg.powerOnBoot;
            settings = {
                General = {
                    Experimental = true;
                    FastConnectable = true;
                };
                Policy = {
                    AutoEnable = true;
                };
            };
        };
    };
}
