{ lib, config, pkgs, ... }:
let
    cfg = config.sys.scripts.startSwayNvidia;
in {
    options = {
        sys.scripts.startSwayNvidia.enable = lib.mkEnableOption "Enable start Sway with Nvidia script";
    };

    config = lib.mkIf cfg.enable {
        home.packages = with pkgs; [
            (writeShellScriptBin
                "start-sway-nvidia"
                (builtins.readFile ../../../../../scripts/start-sway-nvidia.sh)
            )
        ];
    };
}
