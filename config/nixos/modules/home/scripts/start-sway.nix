{ lib, config, pkgs, ... }:
let
    cfg = config.sys.scripts.startSway;
in {
    options = {
        sys.scripts.startSway.enable = lib.mkEnableOption "Enable start Sway with script";
    };

    config = lib.mkIf cfg.enable {
        home.packages = with pkgs; [
            (writeShellScriptBin
                "start-sway"
                (builtins.readFile ../../../../../scripts/start-sway.sh)
            )
        ];
    };
}
