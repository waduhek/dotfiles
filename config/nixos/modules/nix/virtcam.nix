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

        # Enables `exclusive_caps` to work with Chromium based browsers.
        # See: https://github.com/v4l2loopback/v4l2loopback/tree/main?tab=readme-ov-file#options
        # Always has to be Google and their spyware that we're forced to use.
        boot.extraModprobeConfig = ''
            options v4l2loopback exclusive_caps=1
        '';
    };
}
