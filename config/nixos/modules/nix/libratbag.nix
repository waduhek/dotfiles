{ lib, config, ... }:
let
    cfg = config.sys.peripherals.libratbag;
in {
    options = {
        sys.peripherals.libratbag.enable = lib.mkEnableOption "Enables ratbag";
    };

    config = lib.mkIf cfg.enable {
        services.ratbagd.enable = true;
    };
}
