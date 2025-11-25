{ lib, config, pkgs, ... }:
let
    cfg = config.sys.peripherals.virtcam;
in {
    options = {
        sys.peripherals.virtcam.enable = lib.mkEnableOption "Enables virtual webcam using scrcpy";
    };

    config = lib.mkIf cfg.enable {
        environment.systemPackages = [ pkgs.scrcpy ];

        boot.extraModulePackages = with config.boot.kernelPackages; [
            v4l2loopback
        ];
        boot.kernelModules = [ "v4l2loopback" ];
    };
}
