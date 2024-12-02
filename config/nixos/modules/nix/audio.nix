{ lib, pkgs, config, ... }:
let
    cfg = config.sys.audio.pipewire;
in {
    options = {
        sys.audio.pipewire.enable = lib.mkEnableOption "Enables PipeWire";
    };

    config = lib.mkIf cfg.enable {
        services.pipewire = {
            enable = true;
            alsa.enable = true;
            alsa.support32Bit = true;
            pulse.enable = true;
        };

        environment.systemPackages = with pkgs; [
            pavucontrol
        ];
    };
}
