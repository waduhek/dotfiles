{ lib, config, ... }:
let
    cfg = config.sys.gpu.nvidia;
in {
    options = {
        sys.gpu.nvidia = {
            enable = lib.mkEnableOption "Enable Nvidia driver";
            enableCuda = lib.mkEnableOption "Enables support for CUDA";
        };
    };

    config = lib.mkIf cfg.enable {
        hardware.graphics = {
            enable = true;
            enable32Bit = true;
        };

        services.xserver.videoDrivers = [ "nvidia" ];

        hardware.nvidia = {
            modesetting.enable = true;
            powerManagement.enable = true;
            powerManagement.finegrained = false;
            open = true;
            nvidiaSettings = true;
        };

        # Enables CUDA support
        nixpkgs.config.cudaSupport = cfg.enableCuda;
    };
}
