{ lib, config, ... }:
let
    cfg = config.sys.gpu.nvidia;
in {
    options = {
        sys.gpu.nvidia.enable = lib.mkEnableOption "Enable Nvidia driver";
    };

    config = lib.mkIf cfg.enable {
        # TODO: Update this setting to the new one with NixOS 24.11 arrives.
        # Ref: https://wiki.nixos.org/wiki/Nvidia
        hardware.opengl = {
            enable = true;
            driSupport = true;
            driSupport32Bit = true;
        };

        services.xserver.videoDrivers = [ "nvidia" ];

        hardware.nvidia = {
            modesetting.enable = true;
            powerManagement.enable = true;
            powerManagement.finegrained = false;
            open = false;
            nvidiaSettings = true;
        };
    };
}
