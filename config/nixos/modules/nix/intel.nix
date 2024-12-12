{ lib, config, ... }:
let
    cfg = config.sys.gpu.intel;
in {
    options = {
        sys.gpu.intel.enable = lib.mkEnableOption "Enable Intel GPU";
    };

    config = lib.mkIf cfg.enable {
        hardware.graphics = {
            enable = true;
            enable32Bit = true;
        };
    };
}
